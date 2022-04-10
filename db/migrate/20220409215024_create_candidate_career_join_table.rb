class CreateCandidateCareerJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :candidates, :careers do |t|
      # t.index [:candidate_id, :career_id]
      # t.index [:career_id, :candidate_id]
    end
  end
end
