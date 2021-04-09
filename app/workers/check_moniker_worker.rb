require 'sidekiq-scheduler'
class CheckMonikerWorker
  include Sidekiq::Worker
  include MonikersHelper

  URL_API = "https://btc-wbtc-mainnet.quantexe.com/api/v1/peers"

  def perform
    begin
      data = Moniker.all
      mainnet_perform(data, URL_API)
    rescue StandardError => e 
      puts e.message
    end

  end
end