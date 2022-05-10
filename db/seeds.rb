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

p "*****************************************"
p "Ingesting candidate Data in the shape of"
p candidate_data.sample
p "*****************************************"

# create candidates (incumbents) with mandatory data
candidate_data.each do |candidate|

  def date_parser(value)
    # assume text is some kind of texty date. if parsing fails, rescue and return nil
    Date.parse(value.to_s)
  rescue # yes everything
    nil
  end

  margin = candidate['Margin'].to_f
  year_first_elected = candidate['Year first elected'].to_i

  Candidate.create(
    name: candidate["Name"],
    state: candidate["State"],
    gender: candidate["Gender"],
    winnability: candidate["Winnability"],
    party: Party.find_or_create_by(name: candidate["Party"]),
    electorate: Electorate.find_or_create_by(name: candidate["Seat"]),
    faction: Faction.find_or_create_by(name: candidate["Faction"]),
    union: Union.find_or_create_or_nil(name: candidate["Union"]),
    religion: Religion.find_or_create_or_unknown(name: candidate["Religion"]),
    profession: Profession.find_or_create_or_nil(name: candidate["Prior Career"]),
    qualification_level: QualificationLevel.find_or_create_by(name: candidate["Qualification Level"]),
    field_of_study: FieldOfStudy.find_or_create_or_nil(name: candidate["Qualification Field Category"]),
    dob: date_parser(candidate['DOB']),
    year_first_elected: year_first_elected == 0 ? nil : year_first_elected,
    margin: margin == 0.0 ? nil : margin
  )
end

p "********** Seeding is Complete **********"
p "*****************************************"