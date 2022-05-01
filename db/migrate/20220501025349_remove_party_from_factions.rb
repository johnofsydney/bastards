class RemovePartyFromFactions < ActiveRecord::Migration[7.0]
  def change
    remove_reference :factions, :party, null: false, foreign_key: true
  end
end
