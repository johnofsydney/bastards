class CreateElectorates < ActiveRecord::Migration[7.0]
  def change
    create_table :electorates do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
