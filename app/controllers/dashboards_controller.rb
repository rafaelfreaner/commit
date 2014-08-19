class DashboardsController < ApplicationController
  
  def show
    @event = Event.new
  end

end