class Ingestor
  attr_reader :headings, :data

  WHITELIST = ["Name", "Gender", "Party", "Seat", "State", "Faction", "Union", "Religion", "DOB", "Predominant Career", "Qualification Level", "Qualifications Field", "Year first elected", "Margin"]

  def initialize
    csv_file = File.open("sheet_data/Pollies_data.csv", "r")
    lines = csv_file.readlines
    lines.shift(2) # remove top two lines and let them disappear

    @headings = lines.shift.chomp.split(',').map{ |element| trim_element(element) }
    @data = lines.map{|line| line.chomp.split(',') }.map{|line| trim_all_elements(line) }
  end

  def massaged_data
    data.map{ |record| headings.zip(record).to_h } # merge each data row (value) with heading (key) as a hash
        .map{ |record| filter_to_whitelist(record) } # filter to records who have key in whitelist
  end

  def filter_to_whitelist(record)
    record.select{|k, v| WHITELIST.include?(k) }
  end

  def trim_all_elements(record)
    record.map{ |element| trim_element(element) }
  end

  def trim_element(element)
    element.strip
  end

end