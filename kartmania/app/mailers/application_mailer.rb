class ApplicationMailer < ActionMailer::Base
  default from: ENV["SENDGRID_FROM_EMAIL"]
  layout "mailer"
  prepend_view_path "app/views/mails"
  before_action :adjuntar_logo

  private

  def adjuntar_logo
    attachments.inline['logo_kartmania.png'] = File.read(
      Rails.root.join('app/assets/images/logo_kartmania.png')
    )
  end

end
