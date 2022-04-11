class DropCandidatesCarers < ActiveRecord::Migration[7.0]
  def change
    drop_join_table :candidates, :careers
  end
end
