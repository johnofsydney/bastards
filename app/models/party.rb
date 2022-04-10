# == Schema Information
#
# Table name: parties
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Party < ApplicationRecord
  has_many :factions
  has_many :candidates
end
