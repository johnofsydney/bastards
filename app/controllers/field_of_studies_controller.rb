class FieldOfStudiesController < ApplicationController
  before_action :set_field_of_study, only: %i[ show ]

  # GET /field_of_studies or /field_of_studies.json
  def index
    # Fields Of Study
    # first, the general population stats on fields of study
    @genpop_field_of_studies = GeneralPopulation.field_of_study

    # then the field of study breakdown of the major parties
    @alp_field_of_studies = group_by_field_of_study(Candidate.alp)
    @lib_field_of_studies = group_by_field_of_study(Candidate.liberal)
    @nat_field_of_studies = group_by_field_of_study(Candidate.national)

    # finally the list of all fields of study
    @field_of_studies = FieldOfStudy.all
  end

  # GET /field_of_studies/1 or /field_of_studies/1.json
  def show
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_field_of_study
    @field_of_study = FieldOfStudy.find(params[:id])
  end
end
