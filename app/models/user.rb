class User < ApplicationRecord
  has_many :created_events, class_name: 'Event', foreign_key: "creator_id", dependent: :destroy
  has_many :attendances, foreign_key: 'attendee_id'
  has_many :attended_events, class_name: 'Event', through: 'attendances'
end
