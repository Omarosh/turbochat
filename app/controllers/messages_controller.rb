class MessagesController < ApplicationController

    def create
        puts "=====================ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ=========================================================="
        # puts params[:user1]
        # puts params[:user2]
        @user1 = User.find(params[:user1])
        @user2 = User.find(params[:user2])
        @message = @user2.messages.create(body: msg_params[:body], room_id: params[:room_id])
    end
    private
    def msg_params
        params.require(:message).permit(:body)
    end
end