class NotifiUserMailer < ApplicationMailer
  def send_email email
    @content = "hehe"
    @subject = "Subject"
    mail to: email,
          subject: @subject
  end
end
