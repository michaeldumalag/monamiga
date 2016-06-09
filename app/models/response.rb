class Response < ActiveRecord::Base

  belongs_to	:respondable, polymorphic: true

end
