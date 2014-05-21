class SessionsController < ApplicationController
  def login_attempt
    authorized_user = User.authenticate(params[:session][:username_or_email], params[:session][:password])
    if authorized_user
      session[:user_id] = authorized_user.id
 
      @current_user= authorized_user
      redirect_to(:action => 'home', :controller =>'pages')
    else
      flash[:error] = '**Invalid password '
      redirect_to :action => 'home', :controller => 'pages'

    end
  end
  def logout
  session[:user_id] = nil
  redirect_to :action => 'home', :controller => 'pages'
  end
end
