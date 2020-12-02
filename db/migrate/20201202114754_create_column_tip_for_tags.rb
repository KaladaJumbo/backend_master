class CreateColumnTipForTags < ActiveRecord::Migration[6.0]
  def change
    create_table :column_tip_for_tags do |t|
      t.text :tip
    end
  end
end
