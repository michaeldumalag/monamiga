class Vote < ActiveRecord::Base

  belongs_to	:voteable, polymorphic: true

  validates		:voteable_id, uniqueness: {scope: [:user_id, :voteable_type]} 

end
