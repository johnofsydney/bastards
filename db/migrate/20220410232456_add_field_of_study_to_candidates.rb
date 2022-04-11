class AddFieldOfStudyToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_reference :candidates, :field_of_study, null: true, foreign_key: true
  end
end
