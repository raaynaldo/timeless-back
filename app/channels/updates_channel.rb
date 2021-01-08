class UpdatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "update" + params[:user_id].to_s
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
