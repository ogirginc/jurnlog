class SessionMailerPreview < ActionMailer::Preview
  def signed_in_notification
    session = Session.new(user: User.first, ip_address: 'x.x.x.x')
    SessionMailer.with(session:).signed_in_notification
  end
end
