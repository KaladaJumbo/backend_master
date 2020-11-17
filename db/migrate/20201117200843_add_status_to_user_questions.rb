class AddStatusToUserQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :user_questions, :status, :integer
  end
end
