class QualificationLevelsController < ApplicationController
  before_action :set_qualification_level, only: %i[ show edit update destroy ]

  # GET /qualification_levels or /qualification_levels.json
  def index
    @qualification_levels = QualificationLevel.all
  end

  # GET /qualification_levels/1 or /qualification_levels/1.json
  def show
  end

  # GET /qualification_levels/new
  def new
    @qualification_level = QualificationLevel.new
  end

  # GET /qualification_levels/1/edit
  def edit
  end

  # POST /qualification_levels or /qualification_levels.json
  def create
    @qualification_level = QualificationLevel.new(qualification_level_params)

    respond_to do |format|
      if @qualification_level.save
        format.html { redirect_to qualification_level_url(@qualification_level), notice: "Qualification level was successfully created." }
        format.json { render :show, status: :created, location: @qualification_level }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @qualification_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qualification_levels/1 or /qualification_levels/1.json
  def update
    respond_to do |format|
      if @qualification_level.update(qualification_level_params)
        format.html { redirect_to qualification_level_url(@qualification_level), notice: "Qualification level was successfully updated." }
        format.json { render :show, status: :ok, location: @qualification_level }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @qualification_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qualification_levels/1 or /qualification_levels/1.json
  def destroy
    @qualification_level.destroy

    respond_to do |format|
      format.html { redirect_to qualification_levels_url, notice: "Qualification level was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qualification_level
      @qualification_level = QualificationLevel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def qualification_level_params
      params.require(:qualification_level).permit(:level, :candidate_id)
    end
end
