class Question < ActiveRecord::Base

  belongs_to :user
  has_many :answers

  validates :title, presence: true
  validates :content, presence: true

end
