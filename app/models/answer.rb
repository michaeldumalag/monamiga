class Answer < ActiveRecord::Base
  # Remember to create a migration!
  validates :question_id, :user_id, presence:true

  belongs_to :user
  belongs_to :question
end
