class CreateVotes < ActiveRecord::Migration
  def change
  	create_table :votes do |t|
  		t.integer	:voteable_id
  		t.string	:votable_type
  		t.integer	:user_id
  		t.integer	:upvote, default: 0
  		t.timestamps(null: false)
  	end
  end
end
