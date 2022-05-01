class AddYearFirstElectedToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :year_first_elected, :integer
  end
end
