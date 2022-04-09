class AllowNullQualificationReligion < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:candidates, :religion_id, true)
    change_column_null(:candidates, :qualification_id, true)
  end
end
