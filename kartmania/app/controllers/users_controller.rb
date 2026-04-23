class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.all
  end

  def show
    unless current_user == @user
      redirect_to root_path, alert: "No tienes permisos para ver este perfil!."
    end
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
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Usuarios '#{@user.nombre}' actualizado correctamente."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @user == current_user
      redirect_to users_path, alert: "No puedes eliminar tu propia cuenta."
      return
    end

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
