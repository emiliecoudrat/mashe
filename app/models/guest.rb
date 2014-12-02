class Guest < ActiveRecord::Base
  belongs_to :event
  belongs_to :parent

  after_create :send_invitation_email

private
  def send_invitation_email
    GuestMailer.invitation(self).deliver
  end
end
