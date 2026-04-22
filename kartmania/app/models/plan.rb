class Plan < ApplicationRecord
  belongs_to :circuito, optional: true

  has_many :reservas , dependent: :nullify

  validates :nombre, presence: true
  validates :precio, presence: true, numericality: { greater_than: 0 }
  validates :max_participantes, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
