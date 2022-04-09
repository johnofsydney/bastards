class RenameElectorateAddressToLink < ActiveRecord::Migration[7.0]
  def change
    rename_column :electorates, :address, :link
  end
end
