class Circuito < ApplicationRecord

  # Gestión de imagen mediante Active Storage
  # Permite subir una imagen desde el explorador de archivos
    has_one_attached :imagen


  has_many :karts, dependent: :nullify

  has_many :planes, dependent: :nullify


  has_many :torneos, dependent: :nullify

  validates :nombre, presence: true
  validates :kilometros, presence: true
end
