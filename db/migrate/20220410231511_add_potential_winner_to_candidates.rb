class AddPotentialWinnerToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :potential_winner, :boolean
  end
end
