class Question < ActiveRecord::Base

  belongs_to :user

  has_many	:responses, as: :respondable
  has_many	:votes, as: :voteable
  has_many	:answers

  validates  :title, presence: true
  validates  :content, presence: true

end
