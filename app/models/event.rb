class Event < ActiveRecord::Base
  geocoded_by :zipcode
  after_validation :geocode
  belongs_to :user



end
