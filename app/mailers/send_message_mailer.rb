class SendMessageMailer < ApplicationMailer
  def send_message(message)
    @message = message
    mail to: @message.receiver.downcase.strip, subject: @message.subject
  end
end
