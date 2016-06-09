require 'bcrypt'

class User < ActiveRecord::Base

  has_many  :questions
  has_many  :answers
  has_many  :responses
  has_many  :votes

  validates :username, :email, :password_hash, presence: true
  validates :email, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    @user = User.find_by(email: email)
    if @user && @user.password == password
      @user
    else
      nil
    end
  end

end
