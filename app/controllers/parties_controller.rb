require 'data/general_population'

class PartiesController < ApplicationController
  before_action :set_party, only: %i[ show edit update destroy ]


  def index
    @parties = Party.all

  end

  def show
    @genpop_gender = GeneralPopulation.gender
    @genpop_religion = GeneralPopulation.religion
    @genpop_qualification_level = GeneralPopulation.qualification_level
    @genpop_profession = GeneralPopulation.profession
    @genpop_field_of_study = GeneralPopulation.field_of_study
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_party
    @party = Party.find(params[:id])
  end
end