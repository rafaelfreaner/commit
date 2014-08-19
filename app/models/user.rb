class User < ActiveRecord::Base
  has_many :events
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :username, uniqueness: true
end
