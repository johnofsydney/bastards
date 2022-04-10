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
  belongs_to :electorate

  belongs_to :faction, optional: true
  belongs_to :union, optional: true
  belongs_to :religion, optional: true
  belongs_to :qualification, optional: true

  has_and_belongs_to_many :careers



  scope :alp, -> { Candidate.joins(:party).where(party: { name: "Australian Labor Party" }) }
  scope :liberal, -> { Candidate.joins(:party).where(party: { name: "Liberal Party of Australia" }) }
  scope :national, -> do
    Candidate
      .joins(:party)
      .where(
        party: { name: [
          "The Nationals","Liberal National Party of Queensland"
        ]}
      )
  end
  scope :coalition, -> do
    Candidate
      .joins(:party)
      .where(
        party: { name: [
          "The Nationals", "Liberal Party of Australia", "Liberal National Party of Queensland"
        ]}
      )
  end

  scope :green, -> { Candidate.joins(:party).where(party: { name: "Australian Greens" }) }
  scope :phon, -> { Candidate.joins(:party).where(party: { name: "Pauline Hanson's One Nation" }) }

  scope :independent, -> { Candidate.joins(:party).where(party: { name: "Independent" }) }

  scope :minor_party, -> do
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

  scope :lawyer, -> { Candidate.joins(:careers).where(careers: { name: "Law" }) }
  scope :banker, -> { Candidate.joins(:careers).where(careers: { name: "Banking" }) }
  scope :politic, -> do
    Candidate
      .joins(:careers)
      .where(
        careers: { name: [
          'Lobbying', 'Political Staffer', 'Union Official'
        ]}
      )
  end

  scope :catholic, -> { Candidate.joins(:religion).where(religion: { name: "Catholic" }) }
  scope :anglican, -> { Candidate.joins(:religion).where(religion: { name: "Anglican" }) }
  scope :evangelical, -> { Candidate.joins(:religion).where(religion: { name: "Evangelical" }) }
end
