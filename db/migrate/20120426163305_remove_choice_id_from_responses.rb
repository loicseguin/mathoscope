class RemoveChoiceIdFromResponses < ActiveRecord::Migration
  def up
    change_table :responses do |t|
      t.remove :choice_id
      t.remove :chosen
    end
  end

  def down
    change_table :responses do |t|
      t.integer :choice_id
      t.boolean :chosen
    end
  end
end
