Candidate.destroy_all

Party.destroy_all
Religion.destroy_all
Qualification.destroy_all



alp = Party.create(name: "ALP")
liberal = Party.create(name: "Liberal")
national = Party.create(name: "National")
green = Party.create(name: "Green")
one_nation = Party.create(name: "One Nation")
palmer_united = Party.create(name: "Palmer United")
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

# ALP
100.times do
  Candidate.create(
    party: alp,
    name: Faker::Name.name,
    dob: Faker::Date.between(from: 65.years.ago, to: 35.years.ago),
    gender: genders.sample,
    religion: religions.sample,
    qualification: qualifications.sample
  )
end

# LIB
100.times do
  Candidate.create(
    party: liberal,
    name: Faker::Name.name,
    dob: Faker::Date.between(from: 65.years.ago, to: 35.years.ago),
    gender: %w[male male male male female].sample,
    religion: [catholic, anglican, evangelical].sample,
    qualification: [bachelor, higher_degree].sample
  )
end

# National
30.times do
  Candidate.create(
    party: national,
    name: Faker::Name.name,
    dob: Faker::Date.between(from: 65.years.ago, to: 35.years.ago),
    gender: %w[male male male male female].sample,
    religion: [catholic, anglican].sample,
    qualification: [high_school, trade, bachelor].sample
  )
end

# Green
30.times do
  Candidate.create(
    party: green,
    name: Faker::Name.name,
    dob: Faker::Date.between(from: 65.years.ago, to: 35.years.ago),
    gender: genders.sample,
    religion: religions.sample,
    qualification: [bachelor, higher_degree].sample
  )
end

# One Nation
30.times do
  Candidate.create(
    party: one_nation,
    name: Faker::Name.name,
    dob: Faker::Date.between(from: 65.years.ago, to: 35.years.ago),
    gender: genders.sample,
    religion: [catholic, anglican].sample,
    qualification: [high_school, trade].sample
  )
end

# Palmer United
30.times do
  Candidate.create(
    party: palmer_united,
    name: Faker::Name.name,
    dob: Faker::Date.between(from: 65.years.ago, to: 35.years.ago),
    gender: "male",
    religion: [catholic, anglican].sample,
    qualification: [high_school, trade].sample
  )
end


# Other
30.times do
  Candidate.create(
    party: palmer_united,
    name: Faker::Name.name,
    dob: Faker::Date.between(from: 65.years.ago, to: 35.years.ago),
    gender: "male",
    religion: [catholic, anglican].sample,
    qualification: [high_school, trade].sample
  )
end

# Independents
100.times do
  Candidate.create(
    name: Faker::Name.name,
    dob: Faker::Date.between(from: 65.years.ago, to: 35.years.ago),
    gender: %w[female male female male female].sample,
    religion: [catholic, anglican].sample,
    qualification: [bachelor, higher_degree].sample
  )
end
