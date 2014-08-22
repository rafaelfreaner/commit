class EventsController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def create
    current_user.events.create(event_params)
    redirect_to dashboard_path
  end

  def index
    @events = Event.all
    @geojson = Array.new

    @events.each do |event|
      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [event.longitude, event.latitude]
        },
        properties: {
          name: event.name,
          address: event.zipcode,
          time: event.time,
          :'marker-color' => '#00607d',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'medium'
        }
      }
    end
    
    respond_to do |format|
      format.html
      format.json { render json: @geojson }
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :zipcode, :address, :longitude, :latitude, :time, :date)
  end

end