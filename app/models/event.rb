class Event < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  has_many :pending_friendships, -> { where "status = 'pending'" }, through: :friendships
  belongs_to :user
end
