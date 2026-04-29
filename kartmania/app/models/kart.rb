class Kart < ApplicationRecord
  belongs_to :circuito, optional: true

  enum :tipo, { inicial: 0, biplaza: 1, comun: 2, pro: 3 }
  enum :estado, { disponible: 0, en_uso: 1, mantenimiento: 2, averiado: 3 }

  validates :tipo, presence: true
  validates :estado, presence: true
end
