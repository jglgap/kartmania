class Clientes::RegistrationsController < Devise::RegistrationsController

     before_action :configure_sign_up_params, only: [:create]


  def new
    @provincias = Provincia.order(:nombre)
    super
  end


  def create
    @provincias = Provincia.order(:nombre)
    super
  end

  private 

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:provincia_id])
  end

end