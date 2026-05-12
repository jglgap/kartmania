# app/services/google_calendar_service.rb
class GoogleCalendarService

  def initialize
    @token = GoogleToken.first
    raise "No hay tokens de Google Calendar configurados" unless @token
    @token.refresh! if @token.expired?
  end

  # Crea un evento en Google Calendar, añade al cliente como invitado y devuelve el ID
  # @param titulo [String] título del evento
  # @param descripcion [String] descripción del evento
  # @param inicio [DateTime] fecha y hora de inicio
  # @param fin [DateTime] fecha y hora de fin
  # @param email_invitado [String] email del cliente a invitar (opcional)
  def crear_evento(titulo:, descripcion:, inicio:, fin:, email_invitado: nil)
    attendees = []
    
    if email_invitado.present?
      attendees << Google::Apis::CalendarV3::EventAttendee.new(
        email:            email_invitado,
        response_status:  'accepted'  # ← lo marca como aceptado directamente
      )
    end

    evento = Google::Apis::CalendarV3::Event.new(
      summary:     titulo,
      description: descripcion,
      start:       fecha_evento(inicio),
      end:         fecha_evento(fin),
      attendees:   attendees
    )

    resultado = construir_servicio.insert_event('primary', evento, send_updates: 'all')
    resultado.id
  end

  # Actualiza un evento existente en Google Calendar
  # @param event_id [String] ID del evento a actualizar
  # @param titulo [String] nuevo título
  # @param descripcion [String] nueva descripción
  # @param inicio [DateTime] nueva fecha y hora de inicio
  # @param fin [DateTime] nueva fecha y hora de fin
  # @param email_invitado [String] email del cliente invitado (opcional)
  def actualizar_evento(event_id:, titulo:, descripcion:, inicio:, fin:, email_invitado: nil)
    return unless event_id.present?

    evento = Google::Apis::CalendarV3::Event.new(
      summary:     titulo,
      description: descripcion,
      start:       fecha_evento(inicio),
      end:         fecha_evento(fin),
      attendees:   email_invitado ? [Google::Apis::CalendarV3::EventAttendee.new(email: email_invitado)] : []
    )

    construir_servicio.update_event('primary', event_id, evento, send_notifications: true)
  end

  # Elimina un evento de Google Calendar
  # @param event_id [String] ID del evento a eliminar
  def eliminar_evento(event_id)
    return unless event_id.present?
    construir_servicio.delete_event('primary', event_id)
  end

  private

  # Construye el cliente de Google Calendar con las credenciales
  def construir_servicio
    @servicio ||= begin
      credenciales = Google::Auth::UserRefreshCredentials.new(
        client_id:     ENV['GOOGLE_CLIENT_ID'],
        client_secret: ENV['GOOGLE_CLIENT_SECRET'],
        refresh_token: @token.refresh_token,
        access_token:  @token.access_token
      )

      servicio = Google::Apis::CalendarV3::CalendarService.new
      servicio.authorization = credenciales
      servicio
    end
  end

  # Construye el objeto de fecha para Google Calendar
  def fecha_evento(datetime)
    Google::Apis::CalendarV3::EventDateTime.new(
      date_time: datetime.iso8601,
      time_zone: 'Europe/Madrid'
    )
  end

end