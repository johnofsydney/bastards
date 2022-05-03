class ProfessionsController < ApplicationController
  before_action :set_profession, only: %i[ show edit update destroy ]

  # GET /professions or /professions.json
  def index
    # # first, the general population stats on religion
    # @genpop_professions = GeneralPopulation.profession

    # # then the religious breakdown of the major parties
    # @alp_professions = group_by_profession(Candidate.alp)
    # @lib_professions = group_by_profession(Candidate.liberal)
    # @nat_professions = group_by_profession(Candidate.national)

    @profession_data = define_candidate_profession_data

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

  def define_candidate_profession_data
    profession_colors = Color.profession_colors_hash

    genpop = pie_chart_struct(GeneralPopulation.profession, profession_colors)
    alp = pie_chart_struct(group_by_profession(Candidate.alp.incumbent), profession_colors)
    liberal = pie_chart_struct(group_by_profession(Candidate.liberal.incumbent), profession_colors)
    national = pie_chart_struct(group_by_profession(Candidate.national.incumbent), profession_colors)

    OpenStruct.new(genpop: genpop, alp: alp, liberal: liberal, national: national)
  end
end
