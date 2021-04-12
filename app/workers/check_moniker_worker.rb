require 'sidekiq-scheduler'
class CheckMonikerWorker
  include Sidekiq::Worker
  include MonikersHelper
  
  def perform
    begin
      data = Moniker.all
      msg = mainnet_perform(data, ENV["API"])
      
      TelegramBot.send_msg(parse_to_message(msg)) if msg.present?

    rescue StandardError => e 
      puts e.message
    end

  end
end