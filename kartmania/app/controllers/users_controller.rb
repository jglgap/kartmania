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

=begin
  def show
    unless current_user == @user || current_user.admin?
      redirect_to root_path, alert: "No tienes permisos para ver este perfil!."
    end
  end
=end
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user), notice: "Usuarios '#{@user.nombre}' creado correctamente."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
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

=begin 
  def destroy
    if @user == current_user
      redirect_to users_path, alert: "No puedes eliminar tu propia cuenta."
      return
    end

    @user.destroy
    redirect_to users_path, notice: "Usuario '#{@user.nombre}' eliminado correctamente."
  end
=end

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
      :provincia,
      :codigo_postal,
      :telefono
    )
  end

end
