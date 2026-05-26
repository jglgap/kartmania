class KartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_kart, only: [:show, :edit, :update, :destroy]

  def index
      @karts = Kart.all
  end

  def show
  end

  def new
    @kart = Kart.new
    @circuitos = Circuito.all.order(:nombre)
  end

  def create
    @kart = Kart.new(kart_params)

    if @kart.save
      redirect_to kart_path(@kart), notice: "Kart creado correctamente"
    else
      @circuitos = Circuito.all.order(:nombre)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @circuitos = Circuito.all.order(:nombre)
  end

  def update
    if @kart.update(kart_params)
      redirect_to kart_path(@kart), notice: "Kart '#{@kart.tipo}' actualizado correctamente"
    else
      @circuitos = Circuito.all.order(:nombre)
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @kart.destroy
    redirect_to karts_path, notice: "kart borrado correctamente."
  end

  def set_kart
    @kart = Kart.find(params[:id])
  end

  def kart_params
    params.require(:kart).permit(
      :tipo,
      :estado,
      :circuito_id
    )
  end
end
