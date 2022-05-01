class FactionsController < ApplicationController
  before_action :set_faction, only: %i[ show edit update destroy ]

  # GET /factions or /factions.json
  def index
    @factions = Faction.all
  end

  # GET /factions/1 or /factions/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_faction
    @faction = Faction.find(params[:id])
  end
end
