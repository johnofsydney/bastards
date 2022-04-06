class Candidate < ApplicationRecord
  belongs_to :party
  belongs_to :religion
  belongs_to :qualification
end
