class PartiesController < ApplicationController
  before_action :set_party, only: %i[ show edit update destroy ]


  def index
    @parties = Party.all

  end

  def show
    @genpop_religion = {
      anglican: 10,
      catholic: 10,
      evangelical: 5,
      judaism: 1,
      muslim: 1,
      atheist: 50,
      undecided: 23
    }
    @genpop_gender = {
      men: 50,
      women: 50,
    }
    @genpop_profession = {
      butcher: 33,
      baker: 33,
      candlestick_maker: 34
    }
    @genpop_field_of_study = {
      medicine: 33,
      teaching: 33,
      science: 34
    }
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_party
    @party = Party.find(params[:id])
  end
end