class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    def current_ability
      if current_user
        @current_ability ||= Ability.new(current_user)
      elsif current_cliente
        @current_ability ||= Ability.new(current_cliente)
      else
        @current_ability ||= Ability.new(nil)
      end
    end


    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_path, alert: "No tienes permiso para realizar esta acción."
    end

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
