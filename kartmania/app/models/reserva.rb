class Reserva < ApplicationRecord

  belongs_to :plan, optional: true


  has_many :cliente_reservas, dependent: :destroy
  accepts_nested_attributes_for :cliente_reservas

  enum estado: { rechazado: 0, aceptado: 1, pendiente: 2 }
  
  validates :fecha, presence: true
  validates :estado, presence: true

  validate :un_solo_titular
  validate :un_solo_titular, if: -> { cliente_reservas.any? }
  private

  def un_solo_titular
    titulares = cliente_reservas.select(&:es_titular).count
    if titulares == 0
      errors.add(:base, "Debe haber un titular en la reserva")
    elsif titulares > 1
      errors.add(:base, "Solo puede haber un titular por reserva")
    end
  end
end
