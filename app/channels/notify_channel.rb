class NotifyChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notify_channel_#{params[:moniker_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end
