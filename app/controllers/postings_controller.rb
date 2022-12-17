class PostingsController < ApplicationController
  before_action :set_posting, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /postings or /postings.json
  def index
    @postings = Posting.all
  end

  # GET /postings/1 or /postings/1.json
  def show
    @postings = Posting.find(params[:id])
  end

  # GET /postings/new
  def new
    #@posting = Posting.new
    @posting = current_user.posting.build
  end

  # GET /postings/1/edit
  def edit
  end

  # POST /postings or /postings.json
  def create
    #@posting = Posting.new(posting_params)
    @posting = current_user.posting.build(posting_params)

    respond_to do |format|
      if @posting.save
        format.html { redirect_to posting_url(@posting), notice: "Posting was successfully created." }
        format.json { render :show, status: :created, location: @posting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postings/1 or /postings/1.json
  def update


    respond_to do |format|
      if @posting.update(posting_params)
        format.html { redirect_to posting_url(@posting), notice: "Posting was successfully updated." }
        format.json { render :show, status: :ok, location: @posting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postings/1 or /postings/1.json
  def destroy
    @posting.destroy

    respond_to do |format|
      format.html { redirect_to postings_url, notice: "Posting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @posting = current_user.posting.find_by(id: params[:id])
    redirect_to postings_path, notice: "Not Authorized to Edit This Property" if @posting.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posting
      @posting = Posting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def posting_params
      params.require(:posting).permit(:property_name, :address, :rent_per_month, :service_charge, :additional_charges, :security_deposit, :property_size, :property_type, :rooms, :other_details, :inclusions, :user_id)
    end
end
