require 'data/general_population'

class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[ show  ]

  # GET /candidates or /candidates.json
  def index
    @candidates = Candidate.all
    @genpop_religion = GeneralPopulation.religion
    @genpop_gender = GeneralPopulation.gender

  end

  # GET /candidates/1 or /candidates/1.json
  def show
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_candidate
    @candidate = Candidate.find(params[:id])
  end
end
