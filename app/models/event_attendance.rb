class EventAttendance < ApplicationRecord
  belongs_to :attendee, class: "User"
  belongs_to :attended_event, class_name: "Event"
end
