class ApplicationController < ActionController::Base

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id ]) if session[:user_id]
  end
  private
  def require_login
    unless current_user
      redirect_to new_session_path
      flash[:error] = 'Please Login or SignUp'
    end
  end
end
