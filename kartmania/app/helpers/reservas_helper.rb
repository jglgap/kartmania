module ReservasHelper

    def color_estado_reserva(reserva)
        colores = {
            "aceptado" => "bg-success",
            "pendiente" => "bg-warning text-dark",
            "rechazado" => "bg-danger"
        }
        colores[reserva.estado]
    end
end
