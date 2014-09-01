class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, -> { where "status = 'accepted'" }, through: :friendships
  has_many :requested_friends, -> { where "status = 'requested'" }, through: :friendships, source: :friend
  has_many :pending_friends, -> { where "status = 'pending'" }, through: :friendships, source: :friend
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
    friendships.find_by(friend_id: friend.id, event_id: event.id)
  end
end
