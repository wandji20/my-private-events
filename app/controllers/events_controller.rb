class EventsController < ApplicationController

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      current_user.attended_events << @event.event_id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:title, :date, :time, :description)
  end
end
