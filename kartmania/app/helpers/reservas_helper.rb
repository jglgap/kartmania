module ReservasHelper

    def color_estado_reserva(reserva)
        colores = {
            "aceptado" => "bg-success",
            "pendiente" => "bg-warning text-dark",
            "rechazado" => "bg-danger"
        }
        colores[reserva.estado]
    end

    
    def estado_orden(estado)
        orden = {
            "aceptado"     => 1,
            "pendiente"  => 2,
            "rechazado" => 3,
        }
        # Si el estado no está en el hash devolvemos 99 para que vaya al final
        orden[estado.to_s] || 99
  end
end
