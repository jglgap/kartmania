class Participante < ApplicationRecord
  belongs_to :cliente


  belongs_to :torneo

  enum estado: { rechazado: 0, aceptado: 1, en_espera: 2 }

  # Un cliente no puede estar apuntado dos veces al mismo torneo
  validates :cliente_id, uniqueness: { scope: :torneo_id, message: "ya está apuntado a este torneo" }
  validates :estado, presence: true


  validates :fecha_solicitud, presence: true
end
