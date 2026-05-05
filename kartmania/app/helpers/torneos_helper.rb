module TorneosHelper

    def color_dificultad_torneo(torneo)
        colores = {
            "principiante" => "bg-success",
            "intermedio" => "bg-warning text-dark",
            "avanzado" => "bg-danger"
        }
        colores[torneo.dificultad]
    end

    def color_estado_participacion(participacion)
        colores = {
            "aceptado" => "bg-success",
            "en_espera" => "bg-warning text-dark",
            "rechazado" => "bg-danger"            
        }
        colores[participacion.estado]
    end

end
