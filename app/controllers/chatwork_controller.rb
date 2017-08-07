class ChatworkController < ApplicationController
  def index
  end

  def send_message
    ChatWork.api_key = ENV["chatwork_api_key"]
    name = params["/chatwork"][:name]
    account_id = params["/chatwork"][:user_id]
    room_id = params["/chatwork"][:room_id]
    message_body = "[To:#{account_id}] #{name}\n #{params["/chatwork"][:content]}"
    ChatWork::Message.create room_id: room_id, body: message_body
    redirect_to root_path
  end
end
