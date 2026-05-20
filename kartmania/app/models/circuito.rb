class Circuito < ApplicationRecord

  # Gestión de imagen mediante Active Storage
  # Permite subir una imagen desde el explorador de archivos
  has_one_attached :imagen


  has_many :karts, dependent: :nullify

  has_many :plans, dependent: :nullify


  has_many :torneos, dependent: :nullify

  validates :nombre, presence: {message: "tiene que estar presente"}
  validates :kilometros, presence: {message: "tiene que tener un valor"}
end
