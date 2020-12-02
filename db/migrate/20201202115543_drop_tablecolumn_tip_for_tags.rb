class DropTablecolumnTipForTags < ActiveRecord::Migration[6.0]
  def change
    drop_table :column_tip_for_tags
  end
end
