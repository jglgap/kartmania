class Participante < ApplicationRecord
  belongs_to :cliente, optional: true


  belongs_to :torneo, optional: true

  validates :cliente, presence: { message: "no puede estar en blanco" }
  validates :torneo, presence: { message: "no puede estar en blanco" }

  enum estado: { rechazado: 0, aceptado: 1, en_espera: 2 }

  # Un cliente no puede estar apuntado dos veces al mismo torneo
  validates :cliente_id, uniqueness: { scope: :torneo_id, message: "ya está apuntado a este torneo" }
  validates :estado, presence: {message: "tiene que estar elegido uno de los posibles"}
  validates :fecha_solicitud, presence: {message: "tiene que estar elegida"}
  validate :plazas_disponibles, if: :aceptado?


  private

  def plazas_disponibles
    aceptados = torneo.participantes.aceptado.where.not(id: id).count
    if aceptados >= torneo.numero_participantes
      errors.add(:base, "El torneo ya tiene el máximo de participantes aceptados (#{torneo.numero_participantes})")
    end
  end
end
