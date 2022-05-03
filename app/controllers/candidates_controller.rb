require 'data/general_population'
require 'data/color'

class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[ show  ]

  def index
    @candidates = Candidate.all
  end

  def show
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_candidate
    @candidate = Candidate.find(params[:id])
  end
end
