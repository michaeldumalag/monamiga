class CreateVotes < ActiveRecord::Migration
  def change
  	create_table :votes do |t|
  	  t.integer	:voteable_id
			t.string	:voteable_type 
			t.integer	:user_id, null: false 
			t.integer	:value, default: 0
			
			t.timestamps(null: false)
  	end
  end
end
