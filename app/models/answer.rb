class Answer < ActiveRecord::Base

  belongs_to :user
  belongs_to :question
  has_many	 :responses, as: :respondable
  has_many   :votes, as: :voteable

  validates  :question_id, :user_id, presence: true


  def answers_sum
  	self.votes.reduce(0){ |sum, vote| sum += vote.value }
  end
end
