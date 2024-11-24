class EventAttendancesController < ApplicationController
  def create
    event = Event.find(params[:id])
    current_user.attended_events << event
    redirect_to event_path(event), notice: "You're now registered for this event!"
  end

  def destroy
    event = Event.find(params[:id])
    current_user.attended_events.delete(event)
    redirect_to event_path(event), notice: "You're no longer attending this event."
  end
end
