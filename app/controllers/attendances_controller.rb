class AttendancesController < ApplicationController
  def new 

  end

  def create

    event = current_user.attended_events.find_by_id(params[:attended_event_id])
    if !event
      @attendance = current_user.attendances.build(:attended_event_id => params[:attended_event_id])
      if @attendance.save
        redirect_to root_path
      else
        redirect_to new_event_path
      end
    else
      redirect_to root_path
    end

    
  end

end
