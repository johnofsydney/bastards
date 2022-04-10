class Faction < ApplicationRecord
  has_many :candidates
  belongs_to :party
end
