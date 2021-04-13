# Delete records created 2 days ago
require 'sidekiq-scheduler'
class DestroyNotifyLogsWorker
  include Sidekiq::Worker
  
  def perform
    begin
      NotifyLog.where("created_at < '#{2.days.ago}'").delete_all

    rescue StandardError => e 
      puts e.message
    end

  end
end