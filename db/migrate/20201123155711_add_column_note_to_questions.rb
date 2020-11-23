class AddColumnNoteToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :note, :text
  end
end
