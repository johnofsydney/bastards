require 'data/general_population'
require 'data/color'
class ReligionsController < ApplicationController
  before_action :set_religion, only: %i[ show ]

  def index
    # Religions
    # first, the general population stats on religion
    @genpop_religions = GeneralPopulation.religion

    # then the religious breakdown of the major parties
    @all_candidates_by_religion_data = group_by_religion(Candidate.all)

    @alp_candidates_by_religion_data = group_by_religion(Candidate.alp)
    @coalition_candidates_by_religion_data = group_by_religion(Candidate.coalition)


    @religion_colors_for_genpop = set_colors(
      @genpop_religions,
      Color.religion_colors_hash
    )

    @religion_colors_for_all_candidates = set_colors(
      @all_candidates_by_religion_data,
      Color.religion_colors_hash
    )

    @religion_colors_for_alp_candidates = set_colors(
      @alp_candidates_by_religion_data,
      Color.religion_colors_hash
    )

    @religion_colors_for_coalition_candidates = set_colors(
      @coalition_candidates_by_religion_data,
      Color.religion_colors_hash
    )


    @religions = Religion.all
    @candidates = Candidate.all
  end

  def show
    @candidates = @religion.candidates
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_religion
    @religion = Religion.find(params[:id])
  end
end