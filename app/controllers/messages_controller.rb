class MessagesController < ApplicationController
  before_action :set_message, only: [:view_message, :create ]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def view_message
    unless @message
      flash[:message] = "Oops! That message is no longer available"
      redirect_to root_path
    end
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # POST /messages
  # POST /messages.json
  def create
    @message.destroy if @message
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save
        flash[:message] = 'Messages are deleted after 10 minutes!' 
        SendMessageMailer.send_message(@message).deliver_now
        format.html { redirect_to success_path(sender: @message.sender)}
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def success
    @sender = params[:sender]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find_by(sender: params[:message][:sender])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:subject, :receiver, :sender, :body)
    end
end
