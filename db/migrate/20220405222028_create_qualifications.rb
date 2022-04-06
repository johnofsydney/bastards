class CreateQualifications < ActiveRecord::Migration[7.0]
  def change
    create_table :qualifications do |t|
      t.string :level

      t.timestamps
    end
  end
end
