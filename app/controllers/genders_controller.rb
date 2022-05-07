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
      winnable: pie_chart_struct(Candidate.winnable.group(:gender).count, gender_colors),
      safe: pie_chart_struct(Candidate.safe.group(:gender).count, gender_colors),
      senate: pie_chart_struct(Candidate.senate.group(:gender).count, gender_colors),
      lower_house: pie_chart_struct(Candidate.lower_house.group(:gender).count, gender_colors),
    )
    alp = OpenStruct.new(
      all_seats: pie_chart_struct(Candidate.alp.group(:gender).count, gender_colors),
      winnable: pie_chart_struct(Candidate.alp.winnable.group(:gender).count, gender_colors),
      safe: pie_chart_struct(Candidate.alp.safe.group(:gender).count, gender_colors),
      senate: pie_chart_struct(Candidate.alp.senate.group(:gender).count, gender_colors),
      lower_house: pie_chart_struct(Candidate.alp.lower_house.group(:gender).count, gender_colors),
    )
    coalition = OpenStruct.new(
      all_seats: pie_chart_struct(Candidate.coalition.group(:gender).count, gender_colors),
      winnable: pie_chart_struct(Candidate.coalition.winnable.group(:gender).count, gender_colors),
      safe: pie_chart_struct(Candidate.coalition.safe.group(:gender).count, gender_colors),
      senate: pie_chart_struct(Candidate.coalition.senate.group(:gender).count, gender_colors),
      lower_house: pie_chart_struct(Candidate.coalition.lower_house.group(:gender).count, gender_colors),
    )

    OpenStruct.new(
      genpop: genpop,
      all_candidates: all_candidates,
      alp: alp,
      coalition: coalition
      )
  end
end