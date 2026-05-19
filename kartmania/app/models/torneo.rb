class Torneo < ApplicationRecord
  belongs_to :circuito, optional: true


  has_many :participantes, dependent: :destroy


  enum dificultad: { principiante: 0, intermedio: 1, avanzado: 2 }


  validates :nombre, presence: {message: "tiene que estar presente"}
  validates :fecha_torneo, presence: {message: "tiene que estar elegida"}
  validates :numero_participantes, presence: {message: "tiene que tene un valor"},
   numericality: { only_integer: true, 
                  greater_than: 0,
                  message: "tiene que ser un entero mayor a 0"}

  validates :dificultad, presence: {message: "tiene que estar elegido uno de los posibles"}
end
