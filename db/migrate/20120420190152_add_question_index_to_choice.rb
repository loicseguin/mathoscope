class AddQuestionIndexToChoice < ActiveRecord::Migration
  def change
    add_index :choices, :question_id
  end
end
