class CreateAnswer < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id, null: false
      t.integer :user_id, null: false
      t.string :content, null: false, length: {maximum: 5000}

      t.timestamps(null: false)
    end
  end
end
