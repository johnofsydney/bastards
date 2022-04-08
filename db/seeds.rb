require 'pry'
require 'scraper'

Candidate.destroy_all

Party.destroy_all
Religion.destroy_all
Qualification.destroy_all
Electorate.destroy_all


incumbent_data = Scraper.new.fetch_aph


# create parties
incumbent_data.map{|entry| entry[:party]}.uniq.each{ |entry| Party.create(name: entry) }

# create electorates (from APH candidate data)
incumbent_data.map{|entry| entry[:electorate]}.uniq.each{ |entry| Electorate.create(name: entry) }

# Get electorate data from AEC
electorates = Scraper.new.fetch_aec

# Much overkill, but add the link to the AEC electorate page
electorates.each do |scraped_electorate|
  electorate = Electorate.where("name LIKE ?", scraped_electorate[:name] + "%").first
  if electorate.present? # only lower house
    electorate.address = "https://www.aec.gov.au/#{scraped_electorate[:link]}"
    electorate.save
  end
end

catholic = Religion.create(name: "Catholic")
anglican = Religion.create(name: "Anglican")
evangelical = Religion.create(name: "Evangelical")
muslim = Religion.create(name: "Muslim")
judaism = Religion.create(name: "Judaism")
other_religion = Religion.create(name: "Other Religion")
no_religion = Religion.create(name: "No Religion")

high_school = Qualification.create(level: "High School")
trade = Qualification.create(level: "Trade")
bachelor = Qualification.create(level: "Bachelor")
higher_degree = Qualification.create(level: "Higher Degree")

religions = [
  catholic, anglican, evangelical, muslim, judaism, other_religion, no_religion
]

qualifications = [high_school, trade, bachelor, higher_degree]

genders = %w[male female]


def decipher_party(scraped_party)
  Party.find_by(name: scraped_party)
end


def decipher_electorate(scraped_electorate)
  Electorate.find_by(name: scraped_electorate)
end


# create candidates (incumbents)
incumbent_data.each do |mp|
  Candidate.create(
    name: mp[:name],
    party: decipher_party(mp[:party]),
    electorate: decipher_electorate(mp[:electorate]),
    dob: Faker::Date.between(from: 65.years.ago, to: 35.years.ago),
    gender: genders.sample,
    religion: religions.sample,
    qualification: qualifications.sample
  )
end




