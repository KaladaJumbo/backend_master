class AddColumnPointsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :points, :integer
  end
end
