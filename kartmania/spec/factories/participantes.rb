FactoryBot.define do
  factory :participante do
    estado { 1 }
    fecha_solicitud { "2026-04-22" }
    fecha_confirmacion { "2026-04-22" }
    cliente { nil }
    torneo { nil }
  end
end
