class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.references :party, null: false, foreign_key: true
      t.references :religion, null: false, foreign_key: true
      t.references :qualification, null: false, foreign_key: true
      t.string :name
      t.date :dob
      t.date :first_elected
      t.string :gender

      t.timestamps
    end
  end
end
