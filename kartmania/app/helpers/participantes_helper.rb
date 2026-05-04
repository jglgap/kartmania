module ParticipantesHelper

    def color_estado_participante(participante)
        colores = {
            "aceptado" => "bg-success",
            "en_espera" => "bg-warning text-dark",
            "rechazado" => "bg-danger"
        }
        colores[participante.estado]
    end

end
