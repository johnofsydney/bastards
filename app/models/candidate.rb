class Candidate < ApplicationRecord
  include PgSearch::Model
  multisearchable against: :name

  belongs_to :party
  belongs_to :electorate

  belongs_to :faction, optional: true
  belongs_to :union, optional: true
  belongs_to :religion, optional: true
  belongs_to :qualification_level, optional: true
  belongs_to :field_of_study, optional: true
  belongs_to :profession, optional: true




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

  def age
    return 'Unknown' unless dob.present?

    age = Date.today.year - dob.year
    age -= 1 if Date.today < dob + age.years
    age
  end

  def incumbent?
    self.year_first_elected.present?
  end
end

# == Schema Information
#
# Table name: candidates
#
#  id                     :bigint           not null, primary key
#  dob                    :date
#  first_elected          :date
#  gender                 :string
#  margin                 :float
#  name                   :string
#  potential_winner       :boolean
#  state                  :string
#  year_first_elected     :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  electorate_id          :bigint           not null
#  faction_id             :bigint
#  field_of_study_id      :bigint
#  party_id               :bigint           not null
#  profession_id          :bigint
#  qualification_level_id :bigint
#  religion_id            :bigint
#  union_id               :bigint
#
# Indexes
#
#  index_candidates_on_electorate_id           (electorate_id)
#  index_candidates_on_faction_id              (faction_id)
#  index_candidates_on_field_of_study_id       (field_of_study_id)
#  index_candidates_on_party_id                (party_id)
#  index_candidates_on_profession_id           (profession_id)
#  index_candidates_on_qualification_level_id  (qualification_level_id)
#  index_candidates_on_religion_id             (religion_id)
#  index_candidates_on_union_id                (union_id)
#
# Foreign Keys
#
#  fk_rails_...  (electorate_id => electorates.id)
#  fk_rails_...  (faction_id => factions.id)
#  fk_rails_...  (field_of_study_id => field_of_studies.id)
#  fk_rails_...  (party_id => parties.id)
#  fk_rails_...  (profession_id => professions.id)
#  fk_rails_...  (qualification_level_id => qualification_levels.id)
#  fk_rails_...  (religion_id => religions.id)
#  fk_rails_...  (union_id => unions.id)
#
