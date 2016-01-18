require 'test_helper'

class ImageMailerTest < ActionMailer::TestCase
  test 'share_email' do
    image = Image.first
    email = ImageMailer.share_email(
      image: image,
      recipient_email: 'bob@loblaw.com',
      message: ''
    ).deliver_now

    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['no-reply@appfolio.com'], email.from
    assert_equal ['bob@loblaw.com'], email.to
    assert_equal 'Check out this cool image (not a virus I swear)', email.subject

    [:text_part, :html_part].each do |part|
      email_body = email.send(part).body.to_s
      assert_includes email_body, image.url
      assert_not_includes email_body, 'Your friend said:'
    end
  end

  test 'share_email with message' do
    image = Image.first
    email = ImageMailer.share_email(
      image: image,
      recipient_email: 'bob@loblaw.com',
      message: 'This is hilarious'
    ).deliver_now

    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['no-reply@appfolio.com'], email.from
    assert_equal ['bob@loblaw.com'], email.to
    assert_equal 'Check out this cool image (not a virus I swear)', email.subject

    [:text_part, :html_part].each do |part|
      email_body = email.send(part).body.to_s
      assert_includes email_body, image.url
      assert_includes email_body, 'Your friend said:'
      assert_includes email_body, 'This is hilarious'
    end
  end
end
