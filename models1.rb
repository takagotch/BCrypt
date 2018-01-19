class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, :uniqueness => true
  validates :login, presence: true, :uniqueness => true
  validates :email, presence: true, :uniqueness => true
end

