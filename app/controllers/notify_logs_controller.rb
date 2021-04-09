class NotifyLogsController < ApplicationController
  before_action :set_notify_log, only: %i[ show edit update destroy ]

  # GET /notify_logs or /notify_logs.json
  def index
    @notify_logs = NotifyLog.all
  end

  # GET /notify_logs/1 or /notify_logs/1.json
  def show
  end

  # GET /notify_logs/new
  def new
    @notify_log = NotifyLog.new
  end

  # GET /notify_logs/1/edit
  def edit
  end

  # POST /notify_logs or /notify_logs.json
  def create
    @notify_log = NotifyLog.new(notify_log_params)

    respond_to do |format|
      if @notify_log.save
        format.html { redirect_to @notify_log, notice: "Notify log was successfully created." }
        format.json { render :show, status: :created, location: @notify_log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notify_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notify_logs/1 or /notify_logs/1.json
  def update
    respond_to do |format|
      if @notify_log.update(notify_log_params)
        format.html { redirect_to @notify_log, notice: "Notify log was successfully updated." }
        format.json { render :show, status: :ok, location: @notify_log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notify_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notify_logs/1 or /notify_logs/1.json
  def destroy
    @notify_log.destroy
    respond_to do |format|
      format.html { redirect_to notify_logs_url, notice: "Notify log was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notify_log
      @notify_log = NotifyLog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notify_log_params
      params.require(:notify_log).permit(:name, :moniker_id, :api_id)
    end
end
