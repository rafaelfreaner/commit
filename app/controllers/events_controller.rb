class EventsController < ApplicationController

  def create
    current_user.events.create(event_params)
    redirect_to dashboard_path
  end

  def index
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :zipcode, :time, :date)
  end

end