class TorneosController < ApplicationController

  before_action :set_torneo, only: [:show,:edit, :update, :destroy]

  def index
    if params[:search].present?
      search = "%#{params[:search]}%"
      @torneos = Torneo.where("nombre LIKE ? OR CAST(numero_participantes AS CHAR) LIKE ?", search, search)
    else
      @torneos = Torneo.all
    end
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
      redirect_to torneo_path(@torneo), notice: "El torneo '#{@torneo.nombre}' ha sido actualizado correctamente"
    else
      @circuitos = Circuito.all.order(:nombre)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @torneo.destroy 
    redirect_to torneos_path, notice: "Torneo borrado correctamente."
  end

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
