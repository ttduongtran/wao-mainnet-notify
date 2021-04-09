class MonikersController < ApplicationController
  before_action :set_moniker, only: %i[ show edit update destroy ]
  has_scope :page, default: 1
  has_scope :per, default: 10

  # GET /monikers or /monikers.json
  def index
    @monikers = Moniker.all.order(id: :desc).page params[:page]
  end

  # GET /monikers/1 or /monikers/1.json
  def show
  end

  # GET /monikers/new
  def new
    @moniker = Moniker.new
  end

  # GET /monikers/1/edit
  def edit
  end

  # POST /monikers or /monikers.json
  def create
    @moniker = Moniker.new(moniker_params)

    respond_to do |format|
      if @moniker.save
        format.html { redirect_to @moniker, notice: "Moniker was successfully created." }
        format.json { render :show, status: :created, location: @moniker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @moniker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monikers/1 or /monikers/1.json
  def update
    respond_to do |format|
      if @moniker.update(moniker_params)
        format.html { redirect_to @moniker, notice: "Moniker was successfully updated." }
        format.json { render :show, status: :ok, location: @moniker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @moniker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monikers/1 or /monikers/1.json
  def destroy
    @moniker.destroy
    respond_to do |format|
      format.html { redirect_to monikers_url, notice: "Moniker was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moniker
      @moniker = Moniker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def moniker_params
      params.require(:moniker).permit(:name, :uri, :memo, :status)
    end
end
