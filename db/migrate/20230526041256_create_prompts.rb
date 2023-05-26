class CreatePrompts < ActiveRecord::Migration[7.0]
  def change
    create_table :prompts do |t|
      t.text :input
      t.text :response

      t.timestamps
    end
  end
end
