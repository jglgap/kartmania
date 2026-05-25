module PlanesHelper

    def color_plan(plan)
        colores = {
            "normal" => "normal-card",
            "oferta" => "oferta-card",
            "mega_oferta" =>"mega-oferta-card"
        }
        colores[plan.estado]
    end


    def color_estado_plan(plan)
        colores = {
            "normal" => "bg-info",
            "oferta" => "bg-warning text-dark",
            "mega_oferta" =>"bg-danger"
        }
        colores[plan.estado]
    
    end
end
