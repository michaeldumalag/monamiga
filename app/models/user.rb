
require 'bcrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :username, :email, :password_hash, presence: true
  validates :email, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(given_email, given_password)
    if user = self.find_by(email: given_email)
      if user.password == given_password
        return user
      end
    end
  end
end