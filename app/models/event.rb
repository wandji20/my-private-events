class Event < ApplicationRecord
  validates  :title, :description, :location,  presence: true


  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, class_name: 'User', :through => :attendances

  scope :previous_events, -> { where('date < ?', Date.today)}
  scope :upcoming_events, -> { where('date > ?', Date.today)}
end
