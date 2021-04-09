class NotifyLogsController < ApplicationController

  def index
    @notify_logs = NotifyLog.order(id: :desc).page params[:page]
  end

end
