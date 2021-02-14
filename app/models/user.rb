class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :userid, presence:true, uniqueness: true

  has_many :created_events, class_name: 'Event', foreign_key: "creator_id", dependent: :destroy
  has_many :attendances, foreign_key: 'attendee_id'
  has_many :attended_events, class_name: 'Event', through: 'attendances'
end
