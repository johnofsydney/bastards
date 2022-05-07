require 'data/general_population'

require 'data/general_population'
require 'data/color'

class ApplicationController < ActionController::Base


  def group_by_religion(set)
    group_by(set, :religion)
  end

  def group_by_electorate(set)
    group_by(set, :electorate)
  end

  def group_by_faction(set)
    group_by(set, :faction)
  end

  def group_by_field_of_study(set)
    group_by(set, :field_of_study)
  end

  def group_by_party(set)
    group_by(set, :party)
  end

  def group_by_profession(set)
    # for this set of candidates, we will rename the following professions as "Other"
    # "Managers", "Professionals", "Machinery operators and drivers", "Clerical and administrative workers", "Labourers"
    categories = group_by(set, :profession).with_indifferent_access # the original set

    managers = detach_category(categories, "Manager")
    professionals = detach_category(categories, "Professionals")
    machinery = detach_category(categories, "Machinery operators and drivers")
    clerical = detach_category(categories, "Clerical and administrative workers")
    labourers = detach_category(categories, "Labourers")

    categories["Others"] = managers + professionals + machinery + clerical + labourers

    categories
  end

  def detach_category(categories, category)
    return 0.0 unless categories[category].present?

    categories.delete(category).to_f
  end

  def group_by_qualification_level(set)
    qualification_levels = group_by(set, :qualification_level)

    three_diploma = detach_category(qualification_levels, "Advanced Diploma/Diploma/Assoc Diploma")
    two_diploma = detach_category(qualification_levels, "Advanced Diploma/Diploma")

    qualification_levels["Diploma"] = three_diploma + two_diploma

    qualification_levels
  end

  def group_by_union(set)
    group_by(set, :union)
  end

  def group_by(set, group)
    set               # eg Candidate.alp
      .joins(group)   # eg :religion => joins those candidates which also have a religion
      .group(group)   # eg :religion => groups the records according to religion
      .count          # count the records in each religion group
      .map{ |record, count| [record.name, count] } # combine to array
      .to_h           # convert to a hash
  end

  def set_colors(data, color_map)
    color_array = []

    data.each do |category, _|
      color_array << color_map[category]
    end

    color_array
  end

  def pie_chart_struct(data_set, color_map)
    data_set = data_set.reject{|k, v| v == 0 || v == 0.0}

    OpenStruct.new(
        count: data_set,
        colors: set_colors(data_set, color_map)
      )
  end
end

