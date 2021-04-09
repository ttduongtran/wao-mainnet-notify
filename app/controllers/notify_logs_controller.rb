class NotifyLogsController < ApplicationController
  has_scope :page, default: 1
  has_scope :per, default: 10

  def index
    @notify_logs = NotifyLog.all.order(id: :desc).page params[:page]
  end

end
