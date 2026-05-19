class ClienteReserva < ApplicationRecord

  belongs_to :reserva


  belongs_to :cliente, optional: true


  validates :nombre, presence: {message: "tiene que estar presente"}

  validates :dni, presence: {message: "tiene que estar presente"}
  validates :email, 
  format: { with: URI::MailTo::EMAIL_REGEXP,
            message: "no tiene el formato adecuado" },
  presence: {message: "tiene que estar presente"}
  validate  :verificacion_telefono
  validate  :verificacion_dni


  private

  def verificacion_dni
    return if dni.blank?

    dni_limpio = dni.gsub(/[\s\-\.]/, '').upcase

    caracteres = dni_limpio.chars
    unless caracteres.count == 9
      errors.add(:dni, 'debe tener 8 dígitos y 1 letra')
      return
    end

    parte_numerica = caracteres[0..7].join
    letra_introducida = caracteres[8]


    unless parte_numerica.count('0-9') == 8
      errors.add(:dni, 'los primeros 8 caracteres deben ser dígitos')
      return
    end

    letras_validas = 'TRWAGMYFPDXBNJZSQVHLCKE'
    letra_correcta = letras_validas[parte_numerica.to_i % 23]

    unless letra_introducida == letra_correcta
      errors.add(:dni, 'la letra del DNI no es correcta')
    end
  end

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

