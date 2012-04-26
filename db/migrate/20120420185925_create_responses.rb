class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :content
      t.integer :user_id
      t.integer :question_id
      t.integer :choice_id
      t.boolean :chosen

      t.timestamps
    end
  end
end
