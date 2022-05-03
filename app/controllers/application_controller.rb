require 'data/general_population'

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
    group_by(set, :profession)
  end

  def group_by_qualification_level(set)
    group_by(set, :qualification_level)
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
    OpenStruct.new(
        count: data_set,
        colors: set_colors(data_set, color_map)
      )
  end
end

