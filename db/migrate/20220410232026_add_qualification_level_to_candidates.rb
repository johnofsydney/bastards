class AddQualificationLevelToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_reference :candidates, :qualification_level, null: true, foreign_key: true
  end
end
