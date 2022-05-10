class AddWinnabilityToCandidate < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :winnability, :text
  end
end
