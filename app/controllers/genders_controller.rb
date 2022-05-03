class GendersController < ApplicationController

  def index
    @gender_data = define_candidate_gender_data
  end

  private

  def define_candidate_gender_data
    gender_colors = Color.gender_colors_hash

    genpop = pie_chart_struct(GeneralPopulation.gender, gender_colors)

    all_candidates = OpenStruct.new(
      all_seats: pie_chart_struct(Candidate.group(:gender).count, gender_colors),
      winnable: pie_chart_struct(Candidate.winnable.group(:gender).count, gender_colors)
    )
    alp = OpenStruct.new(
      all_seats: pie_chart_struct(Candidate.alp.group(:gender).count, gender_colors),
      winnable: pie_chart_struct(Candidate.alp.winnable.group(:gender).count, gender_colors)
    )
    coalition = OpenStruct.new(
      all_seats: pie_chart_struct(Candidate.coalition.group(:gender).count, gender_colors),
      winnable: pie_chart_struct(Candidate.coalition.winnable.group(:gender).count, gender_colors)
    )

    OpenStruct.new(genpop: genpop, all_candidates: all_candidates, alp: alp, coalition: coalition)
  end
end