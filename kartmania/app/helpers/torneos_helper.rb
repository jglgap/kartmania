module TorneosHelper

    def color_dificultad_torneo(torneo)
        colores = {
            "principiante" => "bg-success",
            "intermedio" => "bg-warning text-dark",
            "avanzado" => "bg-danger"
        }
        colores[torneo.dificultad]
    end

end
