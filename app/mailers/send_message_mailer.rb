class SendMessageMailer < ApplicationMailer
  def send_message(message)
    @message = message
    mail from: @message.sender to: @message.receiver, subject: @message.subject
  end
end
