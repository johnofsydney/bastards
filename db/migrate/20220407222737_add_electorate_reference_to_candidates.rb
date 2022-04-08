class AddElectorateReferenceToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_reference :candidates, :electorate, null: false, foreign_key: true
  end
end
