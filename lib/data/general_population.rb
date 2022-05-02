class GeneralPopulation
  def self.gender
    {
      "Male" =>50,
      "Female" =>50,
    }
  end

  def self.religion
    {
      "No religion" => 30.1,
      "Catholic" =>	24.7,
      "Anglican" =>	13.3,
      "Other Christian"	=> 12.4,
      "Other" =>	11.7,
      "Islam" =>	2.6,
      "Buddhism" =>	2.4,
      "Hinduism" =>	1.9,
      "Sikhism" =>	0.5,
      "Judaism" =>	0.4,
      "Unknown" =>	0.0,
    }
  end


  def self.qualification_level
    # https://www.abs.gov.au/AUSSTATS/abs@.nsf/mediareleasesbyReleaseDate/1533FE5A8541D66CCA2581BF00362D1D
    # https://www.abs.gov.au/ausstats/abs@.nsf/Lookup/by%20Subject/2071.0~2016~Main%20Features~Educational%20Qualifications%20Data%20Summary%20~65
    {
      "High School" => 44,
      "Certificate / Diploma" => 31,
      "Bachelor Degree" => 16,
      "Postgraduate Study" => 7,
    }
    # Bachelor Degree and above is 24% also, 4,181,406
    # Bachelor Degree is 2,882,838 => 16.6 %
    # Postgraduate Study => 7.4%

  end

  def self.profession
    {
      "Retail" => 35,
      "Transport" => 35,
      "Education" => 25,
      "Construction" => 5,
      "Manufacturing" => 5,
      "Health" => 5,
      "Law" => 5,
      "Bankng and Finance" => 5,
    }
  end

  def self.field_of_study
    {
      "Arts" => 35,
      "Science" => 35,
      "Medicine" => 25,
      "Law" => 5,
      "Engineering" => 5,
    }
  end



end