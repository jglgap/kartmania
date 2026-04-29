module KartsHelper

    def color_estado_kart(kart)
        colores = {
            "disponible" => "bg-success",
            "en_uso" => "bg-secondary",
            "mantenimiento" => "bg-warning text-dark",
            "averiado" => "bg-danger"
        }
        colores[kart.estado]
    end

end
