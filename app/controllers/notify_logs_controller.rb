class NotifyLogsController < ApplicationController
  before_action :set_nofity_log, only: %i[ show edit update destroy ]

  def index
    @notify_logs = NotifyLog.order(id: :desc).page params[:page]
  end
  
  # GET /nofity_logs/1 or /nofity_logs/1.json
  def show
  end

  def api
    @api_data = fetch_mainnet_api(ENV["API"])
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
