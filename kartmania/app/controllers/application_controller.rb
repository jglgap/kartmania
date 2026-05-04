class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_por_controlador

  private

  def layout_por_controlador
    devise_controller? ? "devise" : "application"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre, :direccion, :ciudad, :provincia, :codigo_postal, :telefono])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nombre, :direccion, :ciudad, :provincia, :codigo_postal, :telefono])
  end
end
