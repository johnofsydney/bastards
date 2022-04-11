class CreateQualificationLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :qualification_levels do |t|
      t.string :level

      t.timestamps
    end
  end
end
