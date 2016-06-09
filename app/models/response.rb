class Response < ActiveRecord::Base

  belongs_to	:respondable, polymorphic: true
  has_many   :votes, as: :voteable	

end
