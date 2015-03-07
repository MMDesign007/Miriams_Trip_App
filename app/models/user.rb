require 'bcrypt'

class User < ActiveRecord::Base
  has_many :trips
  has_many :destinations, through: :trips
  has_many :reviews

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A.+@.+\..+/, message: "email not valid"}

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    if user && (user.password == password)
      return user
    else nil
    end
  end

end
