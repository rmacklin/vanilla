# Preview all emails at http://localhost:3000/rails/mailers/image_mailer
class ImageMailerPreview < ActionMailer::Preview
  def share_email
    ImageMailer.share_email(
      image: Image.first,
      recipient_email: 'bob@loblaw.com',
      message: "Hey, thought you'd like this! I can't stop laughing XD"
    )
  end

  def share_email_without_message
    ImageMailer.share_email(
      image: Image.first,
      recipient_email: 'bob@loblaw.com',
      message: nil
    )
  end
end
