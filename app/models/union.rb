class Union < ApplicationRecord
  # include PgSearch::Model
  # multisearchable against: :name

  has_many :candidates

  def self.find_or_create_or_nil(name: name_from_sheet)
    return nil unless name.present?

    find_or_create_by(name: name)
  end
end

# == Schema Information
#
# Table name: unions
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
