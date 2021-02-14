class EventsController < ApplicationController
  before_action :require_login, only: [:new, :create, :show]
  
  def index
    @events = Event.all
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      current_user.attended_events << @event
      #@event.attendees << current_user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end
 
  private
    
  def require_login
    unless current_user
      redirect_to new_session_path
      flash[:error] = 'Please Login or SignUp'
    end
  end

  def event_params
    params.require(:event).permit(:title, :date, :time, :description)
  end
end
