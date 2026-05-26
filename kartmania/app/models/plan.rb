class Plan < ApplicationRecord
  belongs_to :circuito, optional: true

  has_many :reservas , dependent: :nullify
  enum :estado, { normal: 0, oferta: 1, mega_oferta: 2}
  # Antes de eliminar el plan, marca todas sus reservas como rechazadas
  before_destroy :rechazar_reservas_asociadas

  validates :nombre, presence: {message: "tiene que estar presente"}
  validates :precio, presence: {message: "tiene que tener valor"},
  numericality: { greater_than: 0, 
  message: "tiene que ser mayor que 0" }

  validates :max_participantes, 
  presence: { message: "tiene que tener un valor" },
  numericality: { 
    only_integer: true,
    greater_than: 0,
    message: "tiene que ser un número entero mayor que 0"
  }

  def rechazar_reservas_asociadas
    reservas.update_all(estado: 0)
  end

end
