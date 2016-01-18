class ApplicationMailer < ActionMailer::Base
  default from: 'Vanilla <no-reply@appfolio.com>'

  layout 'mailer'
end
