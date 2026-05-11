class TorneosMailer < ApplicationMailer
    
    def cambio_estado(participante)
        @participante = participante
        @torneo = participante.torneo.nombre
        @estado = participante.estado
        
        mail(
            to: @participante.cliente.email,
            subject: "Resolución de participación en '#{@torneo}'"
        )
    end

    def cambios_torneo(torneo,participante)
        @torneo = torneo
        @participante = participante
        mail(
            to: @participante.cliente.email,
            subject: "Cambio en las especificaciones del torneo '#{@torneo.nombre}'"
        )
    end

end