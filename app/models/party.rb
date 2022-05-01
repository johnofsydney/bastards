class Party < ApplicationRecord
  include PgSearch::Model
  multisearchable against: :name

  has_many :candidates
end

# == Schema Information
#
# Table name: parties
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
