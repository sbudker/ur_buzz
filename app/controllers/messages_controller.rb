class MessagesController < ApplicationController

  # Creates an instance of a message with empty parameters
  def new
    @message = Message.new
  end

  # Creates a new message with message params
  def create
    @message = Message.new(message_params)

    if @message.valid?
      MessageMailer.new_message(@message).deliver
      flash[:success] = "Thanks for your message!"
      redirect_to root_url
    else
      flash[:alert] = "An error occurred while delivering this message."
      render :new
    end
  end

  private

  # The required and permitted parameters for a message
  def message_params
    params.require(:message).permit(:name, :email, :content)
  end

end