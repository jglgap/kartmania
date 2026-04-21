class Kart < ApplicationRecord
  belongs_to :circuito, optional: true

  enum_tipo: {inicial: 0, biplaza: 1, comun: 2, pro: 3}

  enum_estado: {disponible: 0, en_uso: 1, mantenimiento: 2, averiado: 3}

  validates :tipo, presence: true
  validates :enum_estado, presence: true
end
