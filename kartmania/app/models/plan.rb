class Plan < ApplicationRecord
  belongs_to :circuito, optional: true

  has_many :reservas , dependent: :nullify

  # Antes de eliminar el plan, marca todas sus reservas como rechazadas
  before_destroy :rechazar_reservas_asociadas

  validates :nombre, presence: true
  validates :precio, presence: true, numericality: { greater_than: 0 }
  validates :max_participantes, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def rechazar_reservas_asociadas
    reservas.update_all(estado: 0)
  end

end
