class GuestMailer < ActionMailer::Base
  default from: "share.school1@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.guest_mailer.invitation.subject
  #
  def invitation(guest)

    @parent = guest.parent
    mail(to: @parent.email, subject: "Invitation événement")
  end
end
