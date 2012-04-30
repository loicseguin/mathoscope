class AddNbAnswersToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :nb_answers, :integer
  end
end
