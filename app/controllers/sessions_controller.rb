class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by_userid(params[:userid])
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Welcome #{user.name}\nYou are signed in '
    else 
      render 'new', alert:'Invalid User Id'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'You have succesfully logged out'
  end

end
