class DropTableQualifications < ActiveRecord::Migration[7.0]
  def change
    drop_table :qualifications
  end
end
