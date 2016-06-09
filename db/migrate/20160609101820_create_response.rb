class CreateResponse < ActiveRecord::Migration
   def change
    create_table :responses do |t|
    t.integer :answer_id, null: false
    t.integer :user_id, null: false
    t.string :content, null: false, length: {maximum: 5000}

    t.timestamps(null: false)
    end
end
