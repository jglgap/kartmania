FactoryBot.define do
  factory :torneo do
    nombre { "MyString" }
    descripcion { "MyText" }
    fecha_torneo { "2026-04-22 15:51:23" }
    primer_puesto { "MyString" }
    segundo_puesto { "MyString" }
    tercer_puesto { "MyString" }
    primer_premio { "9.99" }
    segundo_premio { "9.99" }
    tercer_premio { "9.99" }
    numero_participantes { 1 }
    dificultad { 1 }
    circuito { nil }
  end
end
