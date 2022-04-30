require 'data/general_population'
require 'data/color'

class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[ show  ]

  # GET /candidates or /candidates.json
  def index
    @candidates = Candidate.all
    @genpop_religion = GeneralPopulation.religion
    @genpop_gender = GeneralPopulation.gender

    @candidates_by_party_data = group_by_party(@candidates)
    @candidates_by_gender_data = @candidates.group(:gender).count




    @party_colors_for_candidates = set_colors(
      @candidates_by_party_data,
      Color.party_colors_hash
    )

    @gender_colors_for_genpop = set_colors(
      @genpop_gender,
      Color.gender_colors_hash
    )

    @gender_colors_for_candidates = set_colors(
      @candidates_by_gender_data,
      Color.gender_colors_hash
    )
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

