class AddColumnTypeToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :qtype, :text
  end
end
