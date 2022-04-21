require 'pry'
require 'data/massaged_data'
require 'ingestor'

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
candidate_data = Ingestor.new.massaged_data

# create candidates (incumbents) with mandatory data
candidate_data.each do |candidate|
  Candidate.create(
    name: candidate["Name"],
    state: candidate["State"],
    gender: candidate["Gender"],
    party: Party.find_or_create_by(name: candidate["Party"]),
    electorate: Electorate.find_or_create_by(name: candidate["Seat"]),
    faction: Faction.find_or_create_by(name: candidate["Faction"]),
    union: Union.find_or_create_by(name: candidate["Union"]),
    religion: Religion.find_or_create_by(name: candidate["Religion"]),
    profession: Profession.find_or_create_by(name: candidate["Predominant Career"]),
    qualification_level: QualificationLevel.find_or_create_by(name: candidate["Qualification Level"]),
    field_of_study: FieldOfStudy.find_or_create_by(name: candidate["Qualifications Field"]),
  )
end
# TODO: add factions, unions, religion etc from actual data

#####################################################################






