class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  validates :nombre, presence: true
  validate  :verificacion_telefono
  enum tipo: { admin: 0, trabajador: 1 }     
  
  private 

  def verificacion_telefono
    telefono_limpio = telefono.gsub(/[\s\-\.]/, '')

    if telefono_limpio.start_with?('+34', '0034')
      errors.add(:telefono, 'no debe incluir el prefijo internacional (+34 o 0034)')
      return
    end

    unless telefono_limpio.count('0-9') == 9
      errors.add(:telefono, 'debe tener exactamente 9 dígitos')
      return
    end

    digitos = telefono_limpio.chars
    unless ['6', '7', '8', '9'].include?(digitos[0])
      errors.add(:telefono, 'debe empezar por 6, 7, 8 o 9')
      return
    end

    numero_sin_reservado = telefono_limpio.gsub(/\A(900|901|902|800|803|806|807).+/, '')
    if numero_sin_reservado.empty?
      errors.add(:telefono, 'no puede ser un número de servicio especial (900, 901, 902...)')
    end

  end

end
