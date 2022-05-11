class Color

  def self.party_colors_hash
    {
      "Liberal Party of Australia" => "blue",
      "Liberal National Party of Queensland" => "brown",
      "The Nationals" => "yellow",
      "Australian Labor Party" => "red"
    }
  end

  def self.gender_colors_hash
    {
      "Male" => "blue",
      "Female" => "pink",
    }
  end


  def self.religion_colors_hash
    {
      "No religion" => "red",
      "Catholic" =>	"blue",
      "Anglican" =>	"green",
      "Other Christian"	=> "yellow",
      "Other" =>	"indigo",
      "Islam" =>	"cyan",
      "Buddhism" =>	"pink",
      "Hinduism" =>	"purple",
      "Sikhism" =>	"teal",
      "Judaism" =>	"orange",
      "Unknown" =>	"gray"
    }
  end

  def self.profession_colors_hash
    {
      "Lawyers" => "orange",
      "Other" =>	"red",
      "Political" =>	"purple",
      "Unions" =>	"pink",
    }
  end

  def self.qualification_level_colors_hash
    {
      "Postgraduate" => "red",
      "Bachelor Degree" => "blue",
      "Diploma" => "green",
      "Up to Year 12 or Equiv" => "brown",
      "Unknown" => "gray"
    }
  end

  def self.field_of_study_colors_hash
    {
      "Natural and Physical Sciences" => "red",
      "Information Technology" => "blue",
      "Engineering and Related Technologies" => "orange",
      "Architecture and Building" => "green",
      "Agriculture, Environmental and Related Studies" => "cyan",
      "Health" => "pink",
      "Education" => "purple",
      "Management and Commerce" => "magenta",
      "Society and Culture (incl Law)" => "coral",
      "Creative Arts" => "lime",
      "Food, Hospitality and Personal Services" => "cadetblue",
      "n/a" => "gray"
    }
  end
end
