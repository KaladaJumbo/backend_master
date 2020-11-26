class AddColumnMultipleChoiceToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :multipleChoice, :text
  end
end
