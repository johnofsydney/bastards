class FieldOfStudy < ApplicationRecord
  has_many :candidates

  def self.find_or_create_or_nil(name: name_from_sheet)
    return nil unless name.present?

    if name == "Agriculture. Environmental and Related Studies" || name == "Agriculture. environmental and related studies"
      name = "Agriculture, Environmental and Related Studies"
    end

    if name == "Architecture and building"
      name = "Architecture and Building"
    end

    if name == "Creative arts"
      name = "Creative Arts"
    end

    if name == "Engineering and related technologies"
      name = "Engineering and Related Technologies"
    end

    if name == "Management and commerce"
      name = "Management and Commerce"
    end

    if name ==  "Natural and physical sciences"
      name =  "Natural and Physical Sciences"
    end

    if name == "Society and culture (incl Law)"
      name = "Society and Culture (incl Law)"
    end

    if name == "Food. hospitality and personal services"
      name = "Food, Hospitality and Personal Services"
    end

    if name == "Information technology"
      name = "Information Technology"
    end

    find_or_create_by(name: name)
  end
end

# == Schema Information
#
# Table name: field_of_studies
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
