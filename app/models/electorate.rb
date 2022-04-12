class Electorate < ApplicationRecord
  include PgSearch::Model
  multisearchable against: :name

  has_many :candidates
end

# == Schema Information
#
# Table name: electorates
#
#  id         :bigint           not null, primary key
#  link       :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
