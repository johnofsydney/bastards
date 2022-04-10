class UnionsController < ApplicationController
  before_action :set_union, only: %i[ show edit update destroy ]

  # GET /unions or /unions.json
  def index
    @unions = Union.all
  end

  # GET /unions/1 or /unions/1.json
  def show
  end

  # GET /unions/new
  def new
    @union = Union.new
  end

  # GET /unions/1/edit
  def edit
  end

  # POST /unions or /unions.json
  def create
    @union = Union.new(union_params)

    respond_to do |format|
      if @union.save
        format.html { redirect_to union_url(@union), notice: "Union was successfully created." }
        format.json { render :show, status: :created, location: @union }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @union.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unions/1 or /unions/1.json
  def update
    respond_to do |format|
      if @union.update(union_params)
        format.html { redirect_to union_url(@union), notice: "Union was successfully updated." }
        format.json { render :show, status: :ok, location: @union }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @union.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unions/1 or /unions/1.json
  def destroy
    @union.destroy

    respond_to do |format|
      format.html { redirect_to unions_url, notice: "Union was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_union
      @union = Union.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def union_params
      params.require(:union).permit(:name)
    end
end
