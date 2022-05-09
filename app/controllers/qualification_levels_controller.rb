class QualificationLevelsController < ApplicationController
  before_action :set_qualification_level, only: %i[ show ]

  # GET /qualification_levels or /qualification_levels.json
  def index
    @qualification_level_data = define_candidate_qualification_level_data

    @qualification_levels = QualificationLevel.all

    # @candidates = Candidate.all
  end

  # GET /qualification_levels/1 or /qualification_levels/1.json
  def show
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_qualification_level
    @qualification_level = QualificationLevel.find(params[:id])
  end


  def define_candidate_qualification_level_data

    qualification_level_colors = Color.qualification_level_colors_hash

    genpop = pie_chart_struct(GeneralPopulation.qualification_level, qualification_level_colors)
    alp = pie_chart_struct(group_by_qualification_level(Candidate.alp.incumbent), qualification_level_colors)
    liberal = pie_chart_struct(group_by_qualification_level(Candidate.liberal.incumbent), qualification_level_colors)
    national = pie_chart_struct(group_by_qualification_level(Candidate.national.incumbent), qualification_level_colors)
    coalition = pie_chart_struct(group_by_qualification_level(Candidate.coalition.incumbent), qualification_level_colors)

    OpenStruct.new(
      genpop: genpop,
      alp: alp,
      liberal: liberal,
      national: national,
      coalition: coalition,
    )
  end
end
