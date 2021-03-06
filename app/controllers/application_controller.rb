class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  protected 
  def authenticate_user
    if session[:user_id]
     # set current user object to @current_user object variable
      @current_user = User.find session[:user_id] 
      return true	
    else
      return false
    end
  end
  def save_login_state
    if session[:user_id]
      redirect_to(:controller => 'pages', :action => 'home')
      return false
    else
      return true
    end
  end

end
