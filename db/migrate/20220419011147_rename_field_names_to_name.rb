class RenameFieldNamesToName < ActiveRecord::Migration[7.0]
  def change
    rename_column :field_of_studies, :field, :name
    rename_column :qualification_levels, :level, :name
  end
end
