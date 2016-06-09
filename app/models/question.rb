class Question < ActiveRecord::Base

  belongs_to :user
  has_many	 :responses, as: :respondable

  validates  :title, presence: true
  validates  :content, presence: true

end
