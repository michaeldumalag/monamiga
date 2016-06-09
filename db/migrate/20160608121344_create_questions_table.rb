class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false, length: {maximum: 150}
      t.string :content, null: false, length: {maximum: 5000}
      t.integer :user_id, null: false

      t.timestamps(null: false)
    end
  end
end
