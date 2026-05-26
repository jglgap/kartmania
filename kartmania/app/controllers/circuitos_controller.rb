class CircuitosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_circuito, only: [:show, :edit, :update, :destroy]

  def index
      @circuitos = Circuito.all
  end

  def show
  end

  def new
    @circuito = Circuito.new
  end

  def create
    @circuito = Circuito.new(circuito_params)

    if @circuito.save
      redirect_to circuito_path(@circuito), notice: "Circuito creado correctamente."
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @circuito.update(circuito_params)
      redirect_to circuito_path(@circuito), notice: "Circuito '#{@circuito.nombre}' actualizado correctamente."
    else
      render :edit, status: :unprocessable_entity
    end 
  end

  def destroy
    @circuito.destroy
    redirect_to circuitos_path, notice: "Circuito borrado correctamente"
  end

  def set_circuito
    @circuito = Circuito.find(params[:id])
  end

  def circuito_params
    params.require(:circuito).permit(
      :nombre,
      :kilometros,
      :descripcion,
      :imagen
    )
  end
end
