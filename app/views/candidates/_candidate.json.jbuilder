json.extract! candidate, :id, :party_id, :religion_id, :qualification_id, :name, :dob, :first_elected, :gender, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)
