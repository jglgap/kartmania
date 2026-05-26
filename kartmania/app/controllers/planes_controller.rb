class PlanesController < ApplicationController
  before_action :authenticate_user!, except: [:index_cliente]
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  def index
      @planes = Plan.all
  end

  def show
  end

  def new
    @plan = Plan.new
    @circuitos = Circuito.all.order(:nombre)
  end

  def create
    @plan = Plan.new(plan_params)

    if @plan.save
      redirect_to plane_path(@plan), notice: "Plan creado correctamente"
    else
      @circuitos = Circuito.all.order(:nombre)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @circuitos = Circuito.all.order(:nombre)
  end
  
  def update
    if @plan.update(plan_params)
      redirect_to plane_path(@plan), notice: "#{@plan.nombre} ha sido actualizado correctamente."
    else
      @circuitos = Circuito.all.order(:nombre)
    end
  end

  def destroy
    @plan.destroy
    redirect_to planes_path, notice: "Plan borrado correctamente"
  end

  def index_cliente
    redirect_to(root_path, alert: "Acceso no permitido.") and return if current_user
    @planes = Plan.all.order(:nombre)
  end
  
  private
  
  def set_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(
      :nombre,
      :descripcion,
      :precio,
      :max_participantes,
      :circuito_id,
      :estado
    )
  end

end
