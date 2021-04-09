class NotifyLogsController < ApplicationController

  def index
    @notify_logs = NotifyLog.all.order(id: :desc).page params[:page]
  end

end
