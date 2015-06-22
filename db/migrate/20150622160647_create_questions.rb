class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :desription, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end