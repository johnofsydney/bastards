# == Schema Information
#
# Table name: electorates
#
#  id         :bigint           not null, primary key
#  name       :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Electorate < ApplicationRecord
  has_many :candidates
end
