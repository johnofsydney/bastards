class ProfessionsController < ApplicationController
  before_action :set_profession, only: %i[ show edit update destroy ]

  # GET /professions or /professions.json
  def index
        # Religions
    # first, the general population stats on religion
    @genpop_professions = GeneralPopulation.profession

    # then the religious breakdown of the major parties
    @alp_professions = group_by_profession(Candidate.alp)
    @lib_professions = group_by_profession(Candidate.liberal)
    @nat_professions = group_by_profession(Candidate.national)

    # finally the list of all professions
    @professions = Profession.all
  end

  # GET /professions/1 or /professions/1.json
  def show
    @candidates = @profession.candidates
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_profession
    @profession = Profession.find(params[:id])
  end
end
