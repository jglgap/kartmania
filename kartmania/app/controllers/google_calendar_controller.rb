class GoogleCalendarController < ApplicationController


  # Callback de Google OAuth — guarda o actualiza los tokens en base de datos
  def callback
    auth = request.env['omniauth.auth']

    # Busca el token existente o crea uno nuevo
    token = GoogleToken.first_or_initialize

    token.update!(
      access_token:  auth.credentials.token,
      refresh_token: auth.credentials.refresh_token,
      expires_at:    Time.at(auth.credentials.expires_at)
    )

    redirect_to root_path, notice: "Google Calendar conectado correctamente"
  end

  def failure
    redirect_to root_path, alert: "Error al conectar con Google Calendar: #{params[:message]}"
  end

end