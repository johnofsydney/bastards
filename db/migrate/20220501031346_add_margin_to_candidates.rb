class AddMarginToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :margin, :float
  end
end
