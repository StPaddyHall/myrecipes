class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # These are available to all available controllers, however by default not to 
  # the views. The following method is used to make it accessible
  helper_method :current_user, :logged_in?
  
  def current_user
    # find the current user by the session
    # if statement catches the exception
    # ||= creates an instance variable across all views/controllers
    @current_user ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end
  
  def logged_in?
    # gives us a boolean return
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to :back
    end
  end
  
end
