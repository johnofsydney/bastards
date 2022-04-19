require 'pry'
require 'data/massaged_data'

Candidate.destroy_all
Electorate.destroy_all
Faction.destroy_all
FieldOfStudy.destroy_all
Party.destroy_all
Profession.destroy_all
QualificationLevel.destroy_all
Religion.destroy_all
Union.destroy_all

#####################################################################
# import data from lib/data/massaged_data.rb
incumbent_data = MASSAGED_DATA


incumbent_data.map{|entry| entry[:party]}.uniq.each{ |entry| Party.create(name: entry) }
incumbent_data.map{|entry| entry[:electorate]}.uniq.each{ |entry| Electorate.create(name: entry) }
# TODO: add here
# factions (BELONG TO CANDIDATE AND PARTY)
# unions
# field of studies
# level of qualification
# religion

def get_party_record(party_name)
  Party.find_by(name: party_name)
end

def get_electorate_record(electorate_name)
  Electorate.find_by(name: electorate_name)
end

# create candidates (incumbents) with mandatory data
incumbent_data.each do |mp|
  Candidate.create(
    name: mp[:name],
    party: get_party_record(mp[:party]),
    electorate: get_electorate_record(mp[:electorate]),
    dob: Faker::Date.between(from: 65.years.ago, to: 35.years.ago),
    state: mp[:state],
    gender: mp[:gender],
  )
end
# TODO: add factions, unions, religion etc from actual data

#####################################################################





#####################################################################
######################## Dummy Data #################################
#####################################################################

# create factions - alp
alp_factions = ["left", "right", "hard left"].map do |name|
  Faction.create(name: name, party: Party.find_by(name: "Australian Labor Party"))
end

# create factions - libs
lib_factions = ["wet", "dry", "lunatic right"].map do |name|
  Faction.create(name: name, party: Party.find_by(name: "Liberal Party of Australia"))
end

# create factions - nats
nat_factions = ["farming", "mining"].map do |name|
  Faction.create(
    name: name,
    party: Party.find_by(name: ["The Nationals", "Liberal National Party of Queensland"])
    )
end

# create Unions
%w[CFMEU MWU SDA BLT].each do |name|
  Union.create(name: name)
end


catholic = Religion.create(name: "Catholic")
anglican = Religion.create(name: "Anglican")
evangelical = Religion.create(name: "Evangelical")
muslim = Religion.create(name: "Muslim")
judaism = Religion.create(name: "Judaism")
other_religion = Religion.create(name: "Other Religion")
atheist = Religion.create(name: "Atheist")

school = QualificationLevel.create(name: "High Scool")
trade = QualificationLevel.create(name: "Trade")
bachelor = QualificationLevel.create(name: "Bachelor Degree")
higher_degree = QualificationLevel.create(name: "HigherDegree")

arts = FieldOfStudy.create(name: "Arts")
science = FieldOfStudy.create(name: "Science")
medicine = FieldOfStudy.create(name: "Medicine")
law = FieldOfStudy.create(name: "Law")
engineering = FieldOfStudy.create(name: "Engineering")

union_official = Profession.create(name: "Union Official")
political_staffer = Profession.create(name: "Political Staffer")
lawyer = Profession.create(name: "Lawyer")
banker = Profession.create(name: "Banker")
doctor = Profession.create(name: "Doctor")
teacher = Profession.create(name: "Teacher")
farmer = Profession.create(name: "Farmer")



Candidate.alp.each do |candidate|
  candidate.religion = [catholic, anglican, judaism, muslim, catholic, anglican, catholic, anglican, atheist, atheist].sample
  candidate.faction = alp_factions.sample
  candidate.union = Union.all.sample
  candidate.qualification_level = [trade, bachelor, higher_degree].sample
  candidate.field_of_study = [arts, science, law, engineering, medicine].sample
  candidate.profession = [union_official, political_staffer, doctor, teacher].sample
  candidate.save
end

Candidate.coalition.each do |candidate|
  candidate.religion = [catholic, anglican, evangelical, catholic, anglican].sample
  candidate.field_of_study = [arts, law, engineering, medicine].sample
  candidate.faction
  candidate.save
end

Candidate.liberal.each do |candidate|
  candidate.faction = lib_factions.sample
  candidate.qualification_level = [bachelor, higher_degree].sample
  candidate.profession = [political_staffer, doctor, lawyer, banker].sample
  candidate.save
end

Candidate.national.each do |candidate|
  candidate.faction = nat_factions.sample
  candidate.qualification_level = [school, trade, bachelor].sample
  candidate.profession = [political_staffer, lawyer, farmer].sample
  candidate.save
end

Candidate.green.each do |candidate|
  candidate.religion = [catholic, anglican, atheist, atheist, atheist].sample
  candidate.qualification_level = [bachelor, higher_degree].sample
  candidate.profession = [union_official, political_staffer, teacher].sample
  candidate.save
end

Candidate.where(religion: nil).each do |candidate|
  candidate.religion = [atheist, other_religion, muslim, judaism].sample
end




