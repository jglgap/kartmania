FactoryBot.define do
  factory :cliente_reserva do
    nombre { "MyString" }
    telefono { "MyString" }
    email { "MyString" }
    cliente { nil }
    reserva { nil }
  end
end
