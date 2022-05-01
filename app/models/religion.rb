class Religion < ApplicationRecord
  include PgSearch::Model
  multisearchable against: :name

  has_many :candidates

  def self.find_or_create_or_unknown(name: name_from_sheet)
    name = "Unknown" unless name.present?

    find_or_create_by(name: name)
  end
end

# == Schema Information
#
# Table name: religions
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
