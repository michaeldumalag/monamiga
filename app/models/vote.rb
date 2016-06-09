class Vote < ActiveRecord::Base

  belongs_to	:voteable, polymorphic: true

  validates_uniqueness_of :voteable, scope: :user 

end
