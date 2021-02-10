class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by_id_userid(params[:userid])
    if user
      sessions[:userid] = user.id
      redirect_to root_path, notice: 'Welcome #{user.name}\nYou are signed in '
    else 
      render 'new', alert:'Invalid User Id'
    end
  end


end
