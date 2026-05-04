class ApplicationController < ActionController::Base

    layout :layout_por_controlador

    private

    def layout_por_controlador
        devise_controller? ? "devise" : "application"
    end
end
