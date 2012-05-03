class AddGoodAnswerToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :good_answer, :boolean
  end
end
