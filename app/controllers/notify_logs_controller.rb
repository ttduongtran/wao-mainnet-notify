class NotifyLogsController < ApplicationController
  before_action :set_nofity_log, only: %i[ show edit update destroy ]
  include MonikersHelper

  def index
    @notify_logs = NotifyLog.order(id: :desc).page params[:page]
  end
  
  # GET /nofity_logs/1 or /nofity_logs/1.json
  def show
  end

  def api_data
    @data_btc_eth= fetch_mainnet_api(ENV["API_BTC_ETH"])
    @data_btc_bsc= fetch_mainnet_api(ENV["API_BTC_BSC"])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nofity_log
      @nofity_log = NotifyLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nofity_log_params
      params.require(:nofity_log).permit(:name, :uri, :memo, :status)
    end

end
