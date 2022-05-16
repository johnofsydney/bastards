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
      safe: pie_chart_struct(Candidate.safe.group(:gender).count, gender_colors),
      swing: pie_chart_struct(Candidate.safe.group(:gender).count, gender_colors),
      unlikely: pie_chart_struct(Candidate.unlikely.group(:gender).count, gender_colors),
      senate: pie_chart_struct(Candidate.senate.group(:gender).count, gender_colors),
      lower_house: pie_chart_struct(Candidate.lower_house.group(:gender).count, gender_colors),
    )

    alp_mps = OpenStruct.new(
      all: pie_chart_struct(Candidate.alp.lower_house.group(:gender).count, gender_colors),
      safe: pie_chart_struct(Candidate.alp.lower_house.safe.group(:gender).count, gender_colors),
      swing: pie_chart_struct(Candidate.alp.lower_house.swing.group(:gender).count, gender_colors),
      unlikely: pie_chart_struct(Candidate.alp.lower_house.unlikely.group(:gender).count, gender_colors),
    )

    alp_senate = OpenStruct.new(
      all: pie_chart_struct(Candidate.alp.senate.group(:gender).count, gender_colors),
      safe: pie_chart_struct(Candidate.alp.senate.safe.group(:gender).count, gender_colors),
      swing: pie_chart_struct(Candidate.alp.senate.swing.group(:gender).count, gender_colors),
      unlikely: pie_chart_struct(Candidate.alp.senate.unlikely.group(:gender).count, gender_colors),
    )

    alp = OpenStruct.new(
      all_seats: pie_chart_struct(Candidate.alp.group(:gender).count, gender_colors),
      mps: alp_mps,
      senate: alp_senate
    )

    coalition_mps = OpenStruct.new(
      all: pie_chart_struct(Candidate.coalition.lower_house.group(:gender).count, gender_colors),
      safe: pie_chart_struct(Candidate.coalition.lower_house.safe.group(:gender).count, gender_colors),
      swing: pie_chart_struct(Candidate.coalition.lower_house.swing.group(:gender).count, gender_colors),
      unlikely: pie_chart_struct(Candidate.coalition.lower_house.unlikely.group(:gender).count, gender_colors),
    )

    coalition_senate = OpenStruct.new(
      all: pie_chart_struct(Candidate.coalition.senate.group(:gender).count, gender_colors),
      safe: pie_chart_struct(Candidate.coalition.senate.safe.group(:gender).count, gender_colors),
      swing: pie_chart_struct(Candidate.coalition.senate.swing.group(:gender).count, gender_colors),
      unlikely: pie_chart_struct(Candidate.coalition.senate.unlikely.group(:gender).count, gender_colors),
    )

    coalition = OpenStruct.new(
      all_seats: pie_chart_struct(Candidate.coalition.group(:gender).count, gender_colors),
      mps: coalition_mps,
      senate: coalition_senate
    )


    OpenStruct.new(
      genpop: genpop,
      all_candidates: all_candidates,
      alp: alp,
      coalition: coalition
      )
  end
end