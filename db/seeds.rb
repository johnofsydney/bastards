require 'pry'
require 'scraper'

Candidate.destroy_all

Party.destroy_all
Religion.destroy_all
Qualification.destroy_all



alp = Party.create(name: "Australian Labor Party")
liberal = Party.create(name: "Liberal Party of Australia")
national = Party.create(name: "The Nationals")
green = Party.create(name: "Australian Greens")
one_nation = Party.create(name: "Pauline Hanson's One Nation")
independent = Party.create(name: "Independent")
other_party = Party.create(name: "Other Party")



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
  if Party.find_by(name: scraped_party).present?
    return Party.find_by(name: scraped_party)
  end

  Party.find_by(name: "Other Party")
end


scraping_results = Scraper.new.fetch


scraping_results.each do |mp|
  Candidate.create(
    name: mp[:name],
    party: decipher_party(mp[:party]),
    dob: Faker::Date.between(from: 65.years.ago, to: 35.years.ago),
    gender: genders.sample,
    religion: religions.sample,
    qualification: qualifications.sample
  )
end

