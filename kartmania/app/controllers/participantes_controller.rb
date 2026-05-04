class ParticipantesController < ApplicationController

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
      redirect_to participante_path(@participante), notice: "Participante '#{@participante.cliente.nombre}' actualizado correctamente."
    else
      @clientes = Cliente.all.order(:nombre)
      @torneos = Torneo.all.order(:nombre)  
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
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
