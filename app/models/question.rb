class Question < ActiveRecord::Base

  belongs_to :user
  has_many	 :responses, as: :respondable
  has_many   :votes, as: :voteable	

  validates  :title, presence: true
  validates  :content, presence: true

end
