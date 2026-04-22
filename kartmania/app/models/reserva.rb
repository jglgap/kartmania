class Reserva < ApplicationRecord

  belongs_to :plan, optional: true


  has_many :cliente_reservas, dependent: :destroy


  enum estado: { rechazado: 0, aceptado: 1, pendiente: 2 }
  
  validates :fecha, presence: true
  validates :estado, presence: true
end
