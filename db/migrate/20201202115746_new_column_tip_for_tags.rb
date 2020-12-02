class NewColumnTipForTags < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :tip, :text
  end
end
