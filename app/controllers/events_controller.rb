class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end
  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @events
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
  end

  def update
  end

  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:title, :date)
  end
end
