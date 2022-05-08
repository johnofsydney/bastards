class Profession < ApplicationRecord
  has_many :candidates

  def self.find_or_create_or_nil(name: name_from_sheet)
    return nil unless name.present?

    name = "Military" if name == "Miltiary"

    find_or_create_by(name: name)
  end
end

# == Schema Information
#
# Table name: professions
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
