# == Schema Information
#
# Table name: candidates
#
#  id               :bigint           not null, primary key
#  party_id         :bigint           not null
#  religion_id      :bigint           not null
#  qualification_id :bigint           not null
#  name             :string
#  dob              :date
#  first_elected    :date
#  gender           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  electorate_id    :bigint           not null
#
class Candidate < ApplicationRecord
  belongs_to :party
  belongs_to :religion, optional: true
  belongs_to :qualification, optional: true
  belongs_to :electorate

  has_and_belongs_to_many :careers



  scope :alps, -> { Candidate.joins(:party).where(party: { name: "Australian Labor Party" }) }
  scope :coalitions, -> do
    Candidate
      .joins(:party)
      .where(
        party: { name: [
          "The Nationals", "Liberal Party of Australia", "Liberal National Party of Queensland"
        ]}
      )
  end

  scope :greens, -> { Candidate.joins(:party).where(party: { name: "Australian Greens" }) }
  scope :phons, -> { Candidate.joins(:party).where(party: { name: "Pauline Hanson's One Nation" }) }

  scope :independents, -> { Candidate.joins(:party).where(party: { name: "Independent" }) }

  scope :minors, -> do
    Candidate
      .joins(:party)
      .where(
        party: { name: [
          "Centre Alliance",
          "Katter's Australian Party",
          "United Australia Party",
          "Jacqui Lambie Network",
          "Liberal Democratic Party"
        ]}
      )
  end

  scope :lawyers, -> { Candidate.joins(:careers).where(careers: { name: "Law" }) }
  scope :bankers, -> { Candidate.joins(:careers).where(careers: { name: "Banking" }) }
  scope :politics, -> do
    Candidate
      .joins(:careers)
      .where(
        careers: { name: [
          'Lobbying', 'Political Staffer', 'Union Official'
        ]}
      )
  end
end
