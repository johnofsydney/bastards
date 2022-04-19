class ReligionsController < ApplicationController
  before_action :set_religion, only: %i[ show ]

  def index
    # Religions
    # first, the general population stats on religion
    @genpop_religions = GeneralPopulation.religion

    # then the religious breakdown of the major parties
    @alp_religions = group_by_religion(Candidate.alp)
    @lib_religions = group_by_religion(Candidate.liberal)
    @nat_religions = group_by_religion(Candidate.national)

    # finally the list of all religions
    @religions = Religion.all
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