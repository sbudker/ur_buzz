class MessageMailer < ActionMailer::Base

  default from: "User <noreply@urbuzzapp.com>"
  default to: "UR Buzz <urbuzzapp@gmail.com>"

  def new_message(message)
    @message = message

    mail subject: "Message from #{message.name}"
  end

end