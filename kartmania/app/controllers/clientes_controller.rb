class ClientesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      search = "%#{params[:search]}%"
      @clientes = Cliente.where(
        "nombre LIKE ? OR email LIKE ? OR telefono LIKE ?",
        search, search, search
      )
    else
      @clientes = Cliente.all
    end
  end

  def show
  end

  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(cliente_params)
    
    if @cliente.save
      redirect_to cliente_path(@cliente), notice: "Cliente '#{@cliente.nombre}' creado correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end
  
  def update
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
      :provincia,
      :codigo_postal,
      :telefono,
      :mejor_tiempo
    )
  end
end
