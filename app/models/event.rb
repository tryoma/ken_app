class Event < ApplicationRecord
  
  validates :event_day, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true
  validates :place, presence: true
  validates :estimate_people, presence: true
end
