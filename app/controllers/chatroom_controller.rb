class ChatroomController < ApplicationController
    before_action :require_user

    def index
        @message = Message.new
        @messages = Message.all
    end
    def create
        byebug
    end
end