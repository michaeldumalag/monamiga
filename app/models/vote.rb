class Vote < ActiveRecord::Base

  belongs_to	:votable, polymorphic: true

  validates_uniqueness_of :votable, scope: :user 
end
