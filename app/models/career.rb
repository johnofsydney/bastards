class Career < ApplicationRecord
  has_and_belongs_to_many :candidates
end