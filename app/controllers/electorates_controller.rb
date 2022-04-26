class ElectoratesController < ApplicationController
  before_action :set_electorate, only: %i[ show edit update destroy ]

  # GET /electorates or /electorates.json
  def index
    @electorates = Electorate.all
  end

  # GET /electorates/1 or /electorates/1.json
  def show
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_electorate
    @electorate = Electorate.find(params[:id])
  end
end
