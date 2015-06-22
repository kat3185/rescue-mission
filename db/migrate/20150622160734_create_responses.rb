class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :description, null: false
      t.integer :question_id, null: false
      t.integer :user_id
      t.boolean :best, default: false

      t.timestamps
    end
  end
end
