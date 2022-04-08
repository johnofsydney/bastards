# == Schema Information
#
# Table name: qualifications
#
#  id         :bigint           not null, primary key
#  level      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Qualification < ApplicationRecord
end
