class ReservasController < ApplicationController
  before_action :authenticate_user!, except: [:reservar, :crear_reserva, :show_cliente]
  before_action :set_reserva, only: [:show, :edit, :update, :destroy]
  before_action :set_plan_publico, only: [:reservar, :crear_reserva]
  before_action :authenticate_cliente!, only: [:show_cliente]

  def index
      @reservas = Reserva.all
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
      ReservaMailer.confirmacion(@reserva).deliver_later
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
      ReservaMailer.actualizacion(@reserva).deliver_later if @reserva.saved_change_to_estado?
      ReservaMailer.cambio_fecha(@reserva).deliver_later  if @reserva.saved_change_to_fecha?

      calendar = GoogleCalendarService.new
      titular = @reserva.cliente_reservas.find { |cr| cr.es_titular }
      if @reserva.aceptado? && @reserva.saved_change_to_estado?
        event_id = calendar.crear_evento(
          titulo:       "Reserva #{@reserva.plan.nombre} - #{titular.nombre}",
          descripcion:   "Reserva confirmada: #{titular.nombre}",
          inicio:        @reserva.fecha,
          fin:           @reserva.fecha + 2.hours,
          email_invitado: titular.email 
        )
        titular.update_column(:google_event_id, event_id)

      elsif @reserva.rechazado? && @reserva.saved_change_to_estado?
        calendar.eliminar_evento(titular.google_event_id)
        titular.update_column(:google_event_id,nil)
      end

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
    calendar = GoogleCalendarService.new
    titular = @reserva.cliente_reservas.find { |cr| cr.es_titular }
    if titular.present?
      calendar.eliminar_evento(titular.google_event_id)
      titular.update_column(:google_event_id,nil)
    end
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
      
    )

    @reserva.assign_attributes(reserva_params_publico)

    @reserva.cliente_reservas.first&.es_titular = true

    if current_cliente
      @reserva.cliente_reservas.first&.cliente_id = current_cliente.id
    end

    if @reserva.save
      ReservaMailer.confirmacion(@reserva).deliver_later

      redirect_to index_cliente_planes_path, notice: "Reserva creada correctamente. Nos pondremos en contacto"
    else
      render :reservar, status: :unprocessable_entity
    end
  end

  def show_cliente
    reserva_ids = ClienteReserva.where(cliente_id: current_cliente.id, es_titular: true)
                                .pluck(:reserva_id)


    @reservas = Reserva.where(id: reserva_ids)
                      .includes(:plan, :cliente_reservas)
                      .order(fecha: :desc)
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
