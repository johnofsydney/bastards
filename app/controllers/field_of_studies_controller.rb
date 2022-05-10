class FieldOfStudiesController < ApplicationController
  before_action :set_field_of_study, only: %i[ show ]

  def index
    # # Fields Of Study
    # # first, the general population stats on fields of study
    # @genpop_field_of_studies = GeneralPopulation.field_of_study

    # # then the field of study breakdown of the major parties
    # @alp_field_of_studies = group_by_field_of_study(Candidate.alp)
    # @lib_field_of_studies = group_by_field_of_study(Candidate.liberal)
    # @nat_field_of_studies = group_by_field_of_study(Candidate.national)
    @field_of_study_data = define_candidate_field_of_study_data

    @field_of_studies = FieldOfStudy.all

    # @candidates = Candidate.all
  end

  # GET /field_of_studies/1 or /field_of_studies/1.json
  def show
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_field_of_study
    @field_of_study = FieldOfStudy.find(params[:id])
  end

  def define_candidate_field_of_study_data

    field_of_study_colors = Color.field_of_study_colors_hash

    genpop = pie_chart_struct(GeneralPopulation.field_of_study, field_of_study_colors)
    alp = pie_chart_struct(group_by_field_of_study(Candidate.alp.incumbent), field_of_study_colors)
    liberal = pie_chart_struct(group_by_field_of_study(Candidate.liberal.incumbent), field_of_study_colors)
    national = pie_chart_struct(group_by_field_of_study(Candidate.national.incumbent), field_of_study_colors)
    coalition = pie_chart_struct(group_by_field_of_study(Candidate.coalition.incumbent), field_of_study_colors)

    OpenStruct.new(
      genpop: genpop,
      alp: alp,
      liberal: liberal,
      national: national,
      coalition: coalition,
    )
  end
end
