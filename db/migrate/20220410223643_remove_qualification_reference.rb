class RemoveQualificationReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference(:candidates, :qualification, index: true)
  end
end
