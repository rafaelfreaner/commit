class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, through: :friendships
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

  def event_friend?(friend, event)
    Friendship.find_by(friend_id: friend.id, event_id: event.id)
  end
end
