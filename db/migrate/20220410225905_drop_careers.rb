class DropCareers < ActiveRecord::Migration[7.0]
  def change
    drop_table :careers
  end
end
