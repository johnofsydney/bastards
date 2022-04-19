class QualificationLevel < ApplicationRecord
  has_many :candidates
end

# == Schema Information
#
# Table name: qualification_levels
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
