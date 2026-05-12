class ParticipantesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_participante, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      termino = "%#{params[:search]}%"
      

      estados_coincidentes = Participante.estados.select { |k, v| k.include?(params[:search].downcase) }.values

      @participantes = Participante.joins(:cliente, :torneo).where(
        "clientes.nombre LIKE ? OR torneos.nombre LIKE ? OR estado IN (?)",
        termino, termino, estados_coincidentes
      )
    else
      @participantes = Participante.all
    end
  end

  def show
  end

  def new
    @participante = Participante.new
    @participante.fecha_solicitud = Date.today
    @clientes = Cliente.all.order(:nombre)
    @torneos = Torneo.all.order(:nombre)
  end

  def create
    @participante = Participante.new(participante_params)
    @participante.fecha_solicitud = Date.today
    if @participante.save
      redirect_to participante_path(@participante), notice: "Participante creado correctamente."
    else
      @clientes = Cliente.all.order(:nombre)
      @torneos = Torneo.all.order(:nombre)   
      render :new, status: :unprocessable_entity
    end   
  
  end

  def edit
    @clientes = Cliente.all.order(:nombre)
    @torneos = Torneo.all.order(:nombre)
  end

  def update
    if params.dig(:participante, :estado) != @participante.estado
      @participante.fecha_confirmacion = Date.today
    end

    if @participante.update(participante_params_update)

      if @participante.saved_change_to_estado?

        # Enviar email si no está en espera
        TorneosMailer.cambio_estado(@participante).deliver_later unless @participante.en_espera?

        # Gestionar evento en Google Calendar
        calendar = GoogleCalendarService.new

        if @participante.aceptado?
          event_id = calendar.crear_evento(
            titulo:         "Torneo #{@participante.torneo.nombre} — #{@participante.cliente.nombre}",
            descripcion:    "Participante confirmado: #{@participante.cliente.nombre}",
            inicio:         @participante.torneo.fecha_torneo,
            fin:            @participante.torneo.fecha_torneo + 2.hours,
            email_invitado: @participante.cliente.email
          )
          @participante.update_column(:google_event_id, event_id)

        elsif @participante.rechazado?
          calendar.eliminar_evento(@participante.google_event_id)
          @participante.update_column(:google_event_id, nil)

        end
      end

      redirect_to participante_path(@participante), notice: "Participante '#{@participante.cliente.nombre}' actualizado correctamente."
    else
      @clientes = Cliente.all.order(:nombre)
      @torneos  = Torneo.all.order(:nombre)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    calendar = GoogleCalendarService.new
    calendar.eliminar_evento(@participante.google_event_id)
    @participante.destroy
    redirect_to participantes_path, notice: "Participante eliminado correctamente."
  end

  private

  def set_participante
    @participante = Participante.find(params[:id])
  end

  def participante_params
    params.require(:participante).permit(
      :estado,
      :fecha_solicitud,
      :fecha_confirmacion,
      :cliente_id,
      :torneo_id
    )
  end

  def participante_params_update
  params.require(:participante).permit(
    :estado,
    :cliente_id,
    :torneo_id
  )
end

end
