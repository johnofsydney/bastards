class Faction < ApplicationRecord
  include PgSearch::Model
  multisearchable against: :name

  has_many :candidates
  belongs_to :party
end

# == Schema Information
#
# Table name: factions
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  party_id   :bigint           not null
#
# Indexes
#
#  index_factions_on_party_id  (party_id)
#
# Foreign Keys
#
#  fk_rails_...  (party_id => parties.id)
#
