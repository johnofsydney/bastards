class ReligionsController < ApplicationController
  before_action :set_religion, only: %i[ show edit update destroy ]

  def index
    # first, the general population stats on religion
    @genpop_religion = GeneralPopulation.religion

    # then the religious breakdown of the major parties
    @alp_religion = group_by_religion(Candidate.alp)
    @lib_religion = group_by_religion(Candidate.liberal)
    @nat_religion = group_by_religion(Candidate.national)

    @religions = Religion.all
  end

  def show




    # lastly, the candidates identified as belonging to this religion
    @candidates = @religion.candidates
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_religion
    @religion = Religion.find(params[:id])
  end

  def group_by_religion(set)
    set.joins(:religion).group(:religion).count.map{ |k, v| [k.name, v] }.to_h
  end
end