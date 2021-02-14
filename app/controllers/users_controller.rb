class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @upcoming_events = current_user.attended_events.upcoming_events
    @previous_events = current_user.attended_events.previous_events
  end


  private
  def user_params
    params.require(:user).permit(:name, :userid, :email)
  end
  
end
