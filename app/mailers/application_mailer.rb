class ApplicationMailer < ActionMailer::Base
  default from: 'test@email.com'
  layout 'mailer'
end
