class AddUnionReferenceToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_reference :candidates, :union, null: true, foreign_key: true
  end
end
