require 'data/general_population'
require 'data/color'

class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[ show  ]

  # GET /candidates or /candidates.json
  def index
    @candidates = Candidate.all

    @genpop_gender = GeneralPopulation.gender

    # @candidates_by_gender_data = @candidates.group(:gender).count


    # @gender_colors_for_genpop = set_colors(
    #   @genpop_gender,
    #   Color.gender_colors_hash
    # )


    @gender_data = define_candidate_gender_data
  end

  # GET /candidates/1 or /candidates/1.json
  def show
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_candidate
    @candidate = Candidate.find(params[:id])
  end

  def define_candidate_gender_data
    gender_colors = Color.gender_colors_hash

    genpop = pie_chart_struct(GeneralPopulation.gender, gender_colors)

    all_candidates = OpenStruct.new(
      all_seats: pie_chart_struct(Candidate.group(:gender).count, gender_colors),
      winnable: pie_chart_struct(Candidate.winnable.group(:gender).count, gender_colors)
    )
    alp = OpenStruct.new(
      all_seats: pie_chart_struct(Candidate.alp.group(:gender).count, gender_colors),
      winnable: pie_chart_struct(Candidate.alp.winnable.group(:gender).count, gender_colors)
    )
    coalition = OpenStruct.new(
      all_seats: pie_chart_struct(Candidate.coalition.group(:gender).count, gender_colors),
      winnable: pie_chart_struct(Candidate.coalition.winnable.group(:gender).count, gender_colors)
    )

    OpenStruct.new(genpop: genpop, all_candidates: all_candidates, alp: alp, coalition: coalition)
  end
end
