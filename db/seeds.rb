require 'pry'
require 'scraper'

Candidate.destroy_all

Party.destroy_all
Religion.destroy_all
Qualification.destroy_all
Electorate.destroy_all


incumbent_data = Scraper.new.fetch_aph


# create parties (from APH candidate data)
incumbent_data.map{|entry| entry[:party]}.uniq.each{ |entry| Party.create(name: entry) }

# create electorates (from APH candidate data)
incumbent_data.map{|entry| entry[:electorate]}.uniq.each{ |entry| Electorate.create(name: entry) }

# Get electorate data from AEC
electorates = Scraper.new.fetch_aec

# Much overkill, but add the link to the AEC electorate page
electorates.each do |scraped_electorate|
  electorate = Electorate.where("name LIKE ?", scraped_electorate[:name] + "%").first
  if electorate.present? # only lower house
    electorate.link = "https://www.aec.gov.au/#{scraped_electorate[:link]}"
    electorate.save
  end
end

catholic = Religion.create(name: "Catholic")
anglican = Religion.create(name: "Anglican")
evangelical = Religion.create(name: "Evangelical")
muslim = Religion.create(name: "Muslim")
judaism = Religion.create(name: "Judaism")
other_religion = Religion.create(name: "Other Religion")
atheist = Religion.create(name: "Atheist")

high_school = Qualification.create(level: "High School")
trade = Qualification.create(level: "Trade")
bachelor = Qualification.create(level: "Bachelor")
higher_degree = Qualification.create(level: "Higher Degree")

religions = [
  catholic, anglican, evangelical, muslim, judaism, other_religion, atheist
]

qualifications = [high_school, trade, bachelor, higher_degree]

careers = ['Banking', 'Law', 'Lobbying', 'Political Staffer', 'Union Official'].map do |profession|
  Career.create(name: profession)
end


def decipher_party(scraped_party)
  Party.find_by(name: scraped_party)
end


def decipher_electorate(scraped_electorate)
  Electorate.find_by(name: scraped_electorate)
end

def strip_honorifics(name_with_honorifics)
  name_with_honorifics.gsub('Senator the Hon ','')
                      .gsub('Senator ','')
                      .gsub('Ms ', '')
                      .gsub('Mrs ', '')
                      .gsub('Mr ', '')
                      .gsub('Dr ', '')
                      .gsub('Hon ', '')
                      .gsub(' MP','')
                      .gsub(' CSC','')
                      .gsub(' OAM','')
                      .gsub(' AO','')
                      .gsub(' AM','')
                      .gsub(',','')
end

def estimate_gender(candidate_name)
  gender = GenderDetector.new.get_gender(candidate_name.split(' ').first).to_s

  return unless male_or_female(gender)

  gender
end

def male_or_female(gender)
  gender == 'male' || gender == 'female'
end


# create candidates (incumbents) with mandatory data
incumbent_data.each do |mp|
  candidate_name = strip_honorifics(mp[:name])
  Candidate.create(
    name: candidate_name,
    party: decipher_party(mp[:party]),
    electorate: decipher_electorate(mp[:electorate]),
    dob: Faker::Date.between(from: 65.years.ago, to: 35.years.ago),
    gender: estimate_gender(candidate_name),
  )
end

Candidate.all.shuffle.take(50).each do |candidate|
  candidate.qualification = qualifications.sample
  candidate.save
end

Candidate.all.shuffle.take(200).each do |candidate|
  candidate.careers = careers.shuffle.take(2)
  candidate.save
end

Candidate.alp.each do |candidate|
  candidate.religion = [catholic, anglican, judaism, muslim, catholic, anglican, catholic, anglican, atheist, atheist].sample
  candidate.save
end

Candidate.coalition.each do |candidate|
  candidate.religion = [catholic, anglican, evangelical, catholic, anglican].sample
  candidate.save
end

Candidate.green.each do |candidate|
  candidate.religion = [catholic, anglican, atheist, atheist, atheist].sample
  candidate.save
end

Candidate.where(religion: nil).each do |candidate|
  candidate.religion = [atheist, other_religion, muslim, judaism].sample
end