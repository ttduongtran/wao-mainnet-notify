require 'sidekiq-scheduler'
class CheckMonikerWorker
  include Sidekiq::Worker
  include MonikersHelper
  
  def perform
    begin
      data_btc_eth = Moniker.where(moniker_type: 0)
      msg_btc_eth = mainnet_perform(data_btc_eth, ENV["API_BTC_ETH"])

      data_btc_bsc = Moniker.where(moniker_type: 1)
      msg_btc_bsc = mainnet_perform(data_btc_bsc, ENV["API_BTC_BSC"])
      
      msg = msg_btc_eth + msg_btc_bsc

      TelegramBot.send_msg(parse_to_message(msg), ENV["TELEGRAM_CHAT_ID"], token = ENV["TELEGRAM_TOKEN"]) if msg.present?
      TelegramBot.send_msg(parse_to_message(msg), ENV["TELEGRAM_CHAT_ID_TEST"], token = ENV["TELEGRAM_TOKEN_TEST"]) if msg.present?

    rescue StandardError => e 
      puts e.message
    end

  end
end