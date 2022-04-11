class CreateFieldOfStudies < ActiveRecord::Migration[7.0]
  def change
    create_table :field_of_studies do |t|
      t.string :field

      t.timestamps
    end
  end
end
