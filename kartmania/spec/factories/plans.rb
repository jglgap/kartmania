FactoryBot.define do
  factory :plan do
    nombre { "MyString" }
    descripcion { "MyText" }
    precio { "9.99" }
    max_participantes { 1 }
    circuito { nil }
  end
end
