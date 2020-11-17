class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :answer
      t.integer :level_id

      t.timestamps
    end
  end
end
