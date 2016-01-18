class ImageMailer < ApplicationMailer
  def share_email(image:, recipient_email:, message:)
    @image = image
    @message = message
    @descriptor = %w(crazy awesome killer).sample

    mail(to: recipient_email,
         subject: 'Check out this cool image (not a virus I swear)')
  end
end
