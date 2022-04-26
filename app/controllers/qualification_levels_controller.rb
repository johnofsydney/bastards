class QualificationLevelsController < ApplicationController
  before_action :set_qualification_level, only: %i[ show ]

  # GET /qualification_levels or /qualification_levels.json
  def index
    # Qualification Level
    # first, the general population stats on religion
    @genpop_qualification_levels = GeneralPopulation.qualification_level

    # then the religious breakdown of the major parties
    @alp_qualification_levels = group_by_qualification_level(Candidate.alp)
    @lib_qualification_levels = group_by_qualification_level(Candidate.liberal)
    @nat_qualification_levels = group_by_qualification_level(Candidate.national)

    # finally the list of all religions
    @qualification_levels = QualificationLevel.all
  end

  # GET /qualification_levels/1 or /qualification_levels/1.json
  def show
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_qualification_level
    @qualification_level = QualificationLevel.find(params[:id])
  end
end
