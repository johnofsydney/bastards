class AddStateToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :state, :string
  end
end
