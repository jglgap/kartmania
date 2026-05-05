class ReservasController < ApplicationController
  before_action :authenticate_user!, except: [:reservar, :crear_reserva]
  before_action :set_reserva, only: [:show, :edit, :update, :destroy]
  before_action :set_plan_publico, only: [:reservar, :crear_reserva]

  def index
    if params[:search].present?
      search = "%#{params[:search]}%"
      @reservas = Reserva
        .joins(:plan)
        .joins("INNER JOIN cliente_reservas ON cliente_reservas.reserva_id = reservas.id AND cliente_reservas.es_titular = true")
        .where("plans.nombre LIKE ? OR cliente_reservas.nombre LIKE ?", search, search)
    else
      @reservas = Reserva.all
    end

  end

  def show
  end

  def new
    @reserva = Reserva.new
    @planes = Plan.all.order(:nombre)
  end

  def create
    @reserva = Reserva.new(reserva_params)
    @planes = Plan.all.order(:nombre)

    if @reserva.save
      redirect_to new_segundopaso_reservas_path(reserva_id: @reserva.id)
    else
      @planes = Plan.all.order(:nombre)
      render :new, status: :unprocessable_entity
    end

  end

  def new_segundopaso
    @reserva = Reserva.find(params[:reserva_id])
    @clientes = Cliente.all.order(:nombre)
    
    # Construye tantos cliente_reservas como max_participantes tenga el plan
    @reserva.plan.max_participantes.times { @reserva.cliente_reservas.build }
  end
  
  def create_segundopaso
    @reserva = Reserva.find(params[:reserva_id])

    if @reserva.update(reserva_params_paso2)
      redirect_to reserva_path(@reserva), notice: "Reserva creada correctamente"
    else
      @clientes = Cliente.all.order(:nombre)
      render :new_segundopaso, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @reserva.update(reserva_params_update)
      redirect_to reserva_path(@reserva), notice: "Reserva actualizada correctamente"
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def edit_clientes
    @reserva = Reserva.find(params[:id])
    @clientes = Cliente.all.order(:nombre)
  end


  def update_clientes
    @reserva = Reserva.find(params[:id])

    if @reserva.update(reserva_params_paso2)
      redirect_to reserva_path(@reserva), notice: "Clientes de la reserva actualizados correctamente."
    else
      @clientes = Cliente.all.order(:nombre)
      render :edit_clientes, status: :unprocessable_entity
    end
  end

  def destroy
    @reserva.destroy
    redirect_to reservas_path , notice: "Reserva eliminada correctamente"
  end


  def reservar
    authorize! :reservar, @plan
    @reserva = Reserva.new(plan: @plan)
    @plan.max_participantes.times {@reserva.cliente_reservas.build}
    @cliente_actual = current_cliente
  end

  def crear_reserva
    authorize! :reservar, @plan

    @reserva = Reserva.new(
      plan: @plan,
      estado: :pendiente
    )

    @reserva.assign_attributes(reserva_params_publico)

    @reserva.cliente_reservas.first&.es_titular = true

    if current_cliente
      @reserva.cliente_reservas.first&.cliente_id = current_cliente.id
    end

    if @reserva.save
      redirect_to index_cliente_planes_path, notice: "Reserva creada correctamente. Nos pondremos en contacto"
    else
      render :reservar, status: :unprocessable_entity
    end
  end


  private

  def set_reserva
    @reserva = Reserva.find(params[:id])
  end

  def reserva_params
    params.require(:reserva).permit(
      :fecha,
      :plan_id,
      :estado,
      cliente_reservas_attributes: [
        :id, :nombre, :email, :telefono, :dni, :es_titular, :cliente_id
      ]
    )

  end
  
  def reserva_params_paso2
    params.require(:reserva).permit(
      cliente_reservas_attributes: [
        :id, :nombre, :email, :telefono, :dni, :es_titular, :cliente_id
      ]
    )
  end

  def reserva_params_update
    params.require(:reserva).permit(
      :fecha,
      :estado,      
    )
  end

  def reserva_params_publico
    params.require(:reserva).permit(
      :fecha,
      cliente_reservas_attributes: [:nombre, :email, :telefono, :dni, :es_titular, :cliente_id]
    )
  end

  
  def set_plan_publico
    @plan = Plan.find(params[:id])
  end

end
