class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      search = "%#{params[:search].downcase}%"
      @users = User.where(
        "LOWER(nombre) LIKE ? OR LOWER(email) LIKE ? OR LOWER(telefono) LIKE ?",
        search, search, search
      )
    else
      @users = User.all.order(:nombre)
    end
  end

  def show
  end

  def new
    @provincias = Provincia.order(:nombre)
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @provincias = Provincia.order(:nombre)
    if @user.save
      redirect_to user_path(@user), notice: "Usuarios '#{@user.nombre}' creado correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @provincias = Provincia.order(:nombre)
  end

  def update
    @provincias = Provincia.order(:nombre)
    parametros = if params[:user][:password].blank?
      user_params.except(:password,:password_confirmation)
    else
      user_params
    end

    if @user.update(parametros)
      redirect_to user_path(@user), notice: "Usuarios '#{@user.nombre}' actualizado correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
   @user.destroy
    redirect_to users_path, notice: "Usuario '#{@user.nombre}' eliminado correctamente."
  end


  def set_user
      @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :nombre,
      :email,
      :password,
      :password_confirmation,
      :tipo,
      :direccion,
      :ciudad,
      :provincia_id,
      :codigo_postal,
      :telefono
    )
  end

end
