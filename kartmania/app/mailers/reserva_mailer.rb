class ReservaMailer < ApplicationMailer
    def confirmacion(reserva)
        @reserva = reserva
        @participantes = reserva.cliente_reservas.includes(:cliente)
        @cliente = @participantes.find_by(es_titular: true)
        @plan = reserva.plan

        mail(
            to: @cliente.email,
            subject: "Confirmacion de reserva en Kartmania"
        )
    end

    def actualizacion(reserva)
        @reserva = reserva
        @participantes = reserva.cliente_reservas.includes(:cliente)
        @cliente = @participantes.find_by(es_titular: true)
        @plan = reserva.plan
        @estado = reserva.estado

        mail(
            to: @cliente.email,
            subject: "Cambio de estado de reserva"
        )
    end

    def cambio_fecha(reserva)
        @reserva = reserva
        @participantes = reserva.cliente_reservas.includes(:cliente)
        @cliente = @participantes.find_by(es_titular: true)
        @plan = reserva.plan
        @fecha = reserva.fecha

        mail(
            to: @cliente.email,
            subject: "Resolucion de cambio de fecha de la reserva"
        )
    end
end