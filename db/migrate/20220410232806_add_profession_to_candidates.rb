class AddProfessionToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_reference :candidates, :profession, null: true, foreign_key: true
  end
end
