class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :event_attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendances

  scope :past, -> { where("date < ?", Date.today).order(date: :desc) }
  scope :upcoming, -> { where("date >= ?", Date.today).order(date: :asc) }
end
