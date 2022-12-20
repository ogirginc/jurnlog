class TestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.test_mailer.hello.subject
  #
  default from: 'ogulcan@jurnlog.com'

  def hello
    mail(
      subject: 'Hello from Postmark',
      to: 'ogulcan@jurnlog.com',
      from: 'ogulcan@jurnlog.com',
      html_body: '<strong>Hello</strong> dear Postmark user.',
      track_opens: 'true',
      message_stream: 'outbound')
  end
end
