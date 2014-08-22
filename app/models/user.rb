class User < ActiveRecord::Base
  has_many :events
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :username, uniqueness: true
  acts_as_messageable

  def to_param
    username
  end

  def name
    email
  end

  def mailboxer_email(object)
    email
  end

end
