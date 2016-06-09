class CreateVotes < ActiveRecord::Migration
  def change
  	create_table :votes do |t|
  	  t.integer	:voteable_id, null: false 
			t.string	:votable_type, null: false 
			t.integer	:user_id, null: false 
			t.integer	:upvote, default: 0
			
			t.timestamps(null: false)
  	end
  end
end
