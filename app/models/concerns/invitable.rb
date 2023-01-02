module Invitable
  extend ActiveSupport::Concern

  def invited?(code)
    return true if Rails.application.credentials.config[:invitation_code] == code

    errors.add(:you, 'must have an invitation code to sign up!')
    false
  end
end
