class ProfessionsController < ApplicationController
  before_action :set_profession, only: %i[ show edit update destroy ]

  # GET /professions or /professions.json
  def index
    @professions = Profession.all
  end

  # GET /professions/1 or /professions/1.json
  def show
  end

  # GET /professions/new
  def new
    @profession = Profession.new
  end

  # GET /professions/1/edit
  def edit
  end

  # POST /professions or /professions.json
  def create
    @profession = Profession.new(profession_params)

    respond_to do |format|
      if @profession.save
        format.html { redirect_to profession_url(@profession), notice: "Profession was successfully created." }
        format.json { render :show, status: :created, location: @profession }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profession.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professions/1 or /professions/1.json
  def update
    respond_to do |format|
      if @profession.update(profession_params)
        format.html { redirect_to profession_url(@profession), notice: "Profession was successfully updated." }
        format.json { render :show, status: :ok, location: @profession }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profession.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professions/1 or /professions/1.json
  def destroy
    @profession.destroy

    respond_to do |format|
      format.html { redirect_to professions_url, notice: "Profession was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profession
      @profession = Profession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profession_params
      params.require(:profession).permit(:name, :candidate_id)
    end
end
