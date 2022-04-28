require 'data/general_population'
require 'data/color'

class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[ show  ]

  # GET /candidates or /candidates.json
  def index
    @candidates = Candidate.all
    @genpop_religion = GeneralPopulation.religion
    @genpop_gender = GeneralPopulation.gender


    @candidates_by_party_data = @candidates.group(:party).count.map{ |k, v| [k.name, v] }.to_h

    @party_colors = set_party_colors
    @gender_colors = set_gender_colors

    @candidates_by_party_colors = set_colors(
      @candidates_by_party_data,
      Color.party_colors_hash
    )
  end

  # GET /candidates/1 or /candidates/1.json
  def show
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_candidate
    @candidate = Candidate.find(params[:id])
  end

  def set_party_colors
    party_colors = []

    @candidates_by_party_data.each do |score, _|
      party_colors << Color.party_colors_hash[score]
    end

    party_colors
  end

  def set_gender_colors
    gender_colors = []

    @genpop_gender.each do |score, _|
      gender_colors << Color.gender_colors_hash[score]
    end

    gender_colors
  end

  def set_colors(data, color_map)
    color_array = []

    data.each do |score, _|
      color_array << color_map[score]
    end

    color_array
  end
end

