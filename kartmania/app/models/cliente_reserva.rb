class ClienteReserva < ApplicationRecord

  belongs_to :reserva


  belongs_to :cliente, optional: true


  validates :nombre, presence: true

  validates :dni, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: false
end

