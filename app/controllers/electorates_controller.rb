class ElectoratesController < ApplicationController
  before_action :set_electorate, only: %i[ show edit update destroy ]

  # GET /electorates or /electorates.json
  def index
    @electorates = Electorate.all
  end

  # GET /electorates/1 or /electorates/1.json
  def show
  end

  # GET /electorates/new
  def new
    @electorate = Electorate.new
  end

  # GET /electorates/1/edit
  def edit
  end

  # POST /electorates or /electorates.json
  def create
    @electorate = Electorate.new(electorate_params)

    respond_to do |format|
      if @electorate.save
        format.html { redirect_to electorate_url(@electorate), notice: "Electorate was successfully created." }
        format.json { render :show, status: :created, location: @electorate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @electorate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /electorates/1 or /electorates/1.json
  def update
    respond_to do |format|
      if @electorate.update(electorate_params)
        format.html { redirect_to electorate_url(@electorate), notice: "Electorate was successfully updated." }
        format.json { render :show, status: :ok, location: @electorate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @electorate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /electorates/1 or /electorates/1.json
  def destroy
    @electorate.destroy

    respond_to do |format|
      format.html { redirect_to electorates_url, notice: "Electorate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_electorate
      @electorate = Electorate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def electorate_params
      params.require(:electorate).permit(:party_id, :religion_id, :qualification_id, :name, :dob, :first_elected, :gender)
    end
end
