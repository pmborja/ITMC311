class RentingsController < ApplicationController
  before_action :set_renting, only: %i[ show edit update destroy ]

  # GET /rentings or /rentings.json
  def index
    @rentings = Renting.all
  end

  # GET /rentings/1 or /rentings/1.json
  def show
  end

  # GET /rentings/new
  def new
    @renting = Renting.new
  end

  # GET /rentings/1/edit
  def edit
  end

  # POST /rentings or /rentings.json
  def create
    @renting = Renting.new(renting_params)

    respond_to do |format|
      if @renting.save
        format.html { redirect_to renting_url(@renting), notice: "Renting was successfully created." }
        format.json { render :show, status: :created, location: @renting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @renting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rentings/1 or /rentings/1.json
  def update
    respond_to do |format|
      if @renting.update(renting_params)
        format.html { redirect_to renting_url(@renting), notice: "Renting was successfully updated." }
        format.json { render :show, status: :ok, location: @renting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @renting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rentings/1 or /rentings/1.json
  def destroy
    @renting.destroy

    respond_to do |format|
      format.html { redirect_to rentings_url, notice: "Renting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_renting
      @renting = Renting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def renting_params
      params.require(:renting).permit(:start_date, :end_date, :user_id, :posting_id)
    end
end
