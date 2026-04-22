class Torneo < ApplicationRecord
  belongs_to :circuito, optional: true


  has_many :participantes, dependent: :destroy


  enum dificultad: { principiante: 0, intermedio: 1, avanzado: 2 }


  validates :nombre, presence: true
  validates :fecha_torneo, presence: true
  validates :numero_participantes, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :dificultad, presence: true
end
