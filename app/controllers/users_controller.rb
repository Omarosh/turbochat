class UsersController < ApplicationController

  after_action :allow_iframe, only: :show

  def show
    @user1= User.find(params[:id1])
    @user2= User.find(params[:id2])
      @room=Room.new
      @rooms=Room.public_rooms
      @room_name=get_name(@user1,@user2)
      @single_room=Room.where(name: @room_name).first || Room.create_private_room([@user1,@user2],@room_name)
      @message=Message.new
      @messages=@single_room.messages.order(created_at: :asc)
      render 'rooms/index'
    end

    private

    def allow_iframe
      response.headers.except! 'X-Frame-Options'
    end
    
  def get_name(user1,user2)
    user=[user1 , user2].sort
    "private_#{user[0].id}_#{user[1].id}"
  end
end
