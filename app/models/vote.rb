class Vote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :voteable, polymorphic: true
end
