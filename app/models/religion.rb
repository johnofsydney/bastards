# == Schema Information
#
# Table name: religions
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Religion < ApplicationRecord
end
