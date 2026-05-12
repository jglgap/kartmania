class GoogleToken < ApplicationRecord


  def expired?
    expires_at <= Time.current
  end


  def refresh!
    client = OAuth2::Client.new(
      ENV['GOOGLE_CLIENT_ID'],
      ENV['GOOGLE_CLIENT_SECRET'],
      token_url: 'https://oauth2.googleapis.com/token'
    )

    nuevo_token = OAuth2::AccessToken.from_hash(client, {
      refresh_token: refresh_token,
      expires_at:    expires_at.to_i
    }).refresh!

    update!(
      access_token: nuevo_token.token,
      expires_at:   Time.at(nuevo_token.expires_at)
    )
  end
end