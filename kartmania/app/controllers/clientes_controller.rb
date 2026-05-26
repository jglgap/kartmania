class ClientesController < ApplicationController
  before_action :authenticate_user!, except: [:edit_cliente, :update_cliente, :show_cliente]
  before_action :authenticate_cliente!, only: [:edit_cliente, :update_cliente, :show_cliente]
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
      @clientes = Cliente.all
  end

  def show
  end

  def new
    @cliente = Cliente.new
    @provincias = Provincia.order(:nombre)
  end

  def create
    @cliente = Cliente.new(cliente_params)
    @provincias = Provincia.order(:nombre)
    if @cliente.save
      redirect_to cliente_path(@cliente), notice: "Cliente '#{@cliente.nombre}' creado correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @provincias = Provincia.order(:nombre)
  end
  
  def update
    @provincias = Provincia.order(:nombre)
    parametros = if cliente_params[:password].blank?
                  cliente_params.except(:password,:password_confirmation)
                else
                  cliente_params
                end
    if @cliente.update(parametros)
      redirect_to cliente_path(@cliente), notice: "Cliente actualizado correctamente"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    calendar = GoogleCalendarService.new
    @cliente.participantes.aceptado.each do |participante|
      calendar.eliminar_evento(participante.google_event_id)
    end
    @cliente.destroy
    redirect_to clientes_path, notice: "Cliente eliminado correctamente"
  end

  def datos
  @cliente = Cliente.find(params[:id])
  render json: {
    nombre: @cliente.nombre,
    email: @cliente.email,
    telefono: @cliente.telefono
  }
  end

  def show_cliente
    @cliente = current_cliente
    authorize! :show_cliente, @cliente
  end

  def edit_cliente
    @cliente = current_cliente
    authorize! :edit_cliente, @cliente
    @provincias = Provincia.order(:nombre)
  end

  def update_cliente
    @provincias = Provincia.order(:nombre)
      @cliente = current_cliente
      if @cliente.update(cliente_edit_params)
        redirect_to root_path, notice: "Perfil actualizado correctamente"
      else
        render :edit_cliente, status: :unprocessable_entity
      end
  end

  private

  def set_client
    @cliente = Cliente.find(params[:id])
  end

  def cliente_params
    params.require(:cliente).permit(
      :nombre,
      :email,
      :password,
      :password_confirmation,
      :direccion,
      :ciudad,
      :provincia_id,
      :codigo_postal,
      :telefono,
      :mejor_tiempo
    )
  end

  def cliente_edit_params
    params.require(:cliente).permit(
      :nombre,
      :direccion,
      :ciudad,
      :provincia_id,
      :codigo_postal,
      :telefono
    )
  end
end
