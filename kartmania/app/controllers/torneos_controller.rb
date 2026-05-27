class TorneosController < ApplicationController
  before_action :authenticate_user!, except: [:index_cliente, :participar, :no_participar]
  before_action :authenticate_cliente!, only: [:participar, :no_participar]
  before_action :set_torneo, only: [:show,:edit, :update, :destroy, :participar, :no_participar]
  layout "landing", only: [:index_cliente]
  def index
      @torneos = Torneo.all
  end

  def show
  end

  def new
    @torneo = Torneo.new
    @circuitos = Circuito.all.order(:nombre)
  end

  def create
    @torneo = Torneo.new(torneo_params)

    if @torneo.save
      redirect_to torneo_path(@torneo), notice: "El torneo ha sido creado correctamente"
    else
      @circuitos = Circuito.all.order(:nombre)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @circuitos = Circuito.all.order(:nombre)
  end
  
  def update
    if @torneo.update(torneo_params)

      calendar = GoogleCalendarService.new

      @torneo.participantes.aceptado.each do |participante|

        TorneosMailer.cambios_torneo(@torneo,participante).deliver_later
        
        if participante.google_event_id.present?
          calendar.actualizar_evento(
            event_id:       participante.google_event_id,
            titulo:         "Torneo #{@torneo.nombre} — #{participante.cliente.nombre}",
            descripcion:    "Participante confirmado: #{participante.cliente.nombre}",
            inicio:         @torneo.fecha_torneo,
            fin:            @torneo.fecha_torneo + 2.hours,
            email_invitado: participante.cliente.email
          )
        end

      end
      redirect_to torneo_path(@torneo), notice: "El torneo '#{@torneo.nombre}' ha sido actualizado correctamente"
    else
      @circuitos = Circuito.all.order(:nombre)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    calendar = GoogleCalendarService.new

    @torneo.participantes.aceptado.each do |participante|
      calendar.eliminar_evento(participante.google_event_id)
    end
    @torneo.destroy 
    redirect_to torneos_path, notice: "Torneo borrado correctamente."
  end


  def index_cliente
    redirect_to(root_path, alert: "Acceso no permitido") and return if current_user

    @torneos = Torneo.where("fecha_torneo > ?", Date.today).order(:fecha_torneo)

    if current_cliente
      @participaciones = current_cliente.participantes.index_by(&:torneo_id)
    else
      @participaciones = {}
    end
  end

  def participar
    authorize! :participar, @torneo

    if Participante.exists?(cliente_id: current_cliente.id, torneo_id: @torneo.id)
      redirect_to index_cliente_torneos_path, alert: "Ya estas apuntado en este torneo"
      return
    end

    @participante = Participante.new(
      cliente_id: current_cliente.id,
      torneo_id: @torneo.id,
      estado: :en_espera,
      fecha_solicitud: Date.today
    )

    if @participante.save
      redirect_to index_cliente_torneos_path, notice: "Te has apuntado correctamente"
    else
      redirect_to index_cliente_torneos_path, alert: "Problemas para realizar su inscripcion"
    end
  end

  def no_participar
    authorize! :participar, @torneo

    participante = Participante.find_by(cliente_id: current_cliente.id, torneo_id: @torneo)
    if participante
      participante.destroy
      redirect_to index_cliente_torneos_path, notice: "Has eliminado tu participacion"
    else
      redirect_to index_cliente_torneos_path, notice: "No estas apuntado a este torneo"
    end
  end

  private 

  def set_torneo
    @torneo = Torneo.find(params[:id])
  end

  def torneo_params
    params.require(:torneo).permit(
      :nombre,
      :descripcion,
      :fecha_torneo,
      :numero_participantes,
      :dificultad,
      :circuito_id,
      :primer_puesto,
      :segundo_puesto,
      :tercer_puesto,
      :primer_premio,
      :segundo_premio,
      :tercer_premio
    )
  end

end
