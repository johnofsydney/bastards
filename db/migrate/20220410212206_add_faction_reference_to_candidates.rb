class AddFactionReferenceToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_reference :candidates, :faction, null: true, foreign_key: true
  end
end
