# == Schema Information
#
# Table name: candidates
#
#  id               :bigint           not null, primary key
#  party_id         :bigint           not null
#  religion_id      :bigint           not null
#  qualification_id :bigint           not null
#  name             :string
#  dob              :date
#  first_elected    :date
#  gender           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  electorate_id    :bigint           not null
#
class Candidate < ApplicationRecord
  belongs_to :party
  belongs_to :religion
  belongs_to :qualification
  belongs_to :electorate
end
