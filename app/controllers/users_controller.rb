class UsersController < ApplicationController
#before_filter :save_login_state, :only => [:new, :create]
def new
    @user = User.new 
    render 'new'
  end
def create
  @user = User.new(user_params)
  if @user.save
    flash[:notice] = "You signed up successfully"
    flash[:color]= "valid"
    session[:user_id]=@user.id
    redirect_to :controller=> 'pages', :action => 'home'
  else
    flash[:notice] = "Form is invalid"
    flash[:color]= "invalid"
    render 'new'
  end
end

def show
end

def edit
end

def update
  respond_to do |format|
    @user = User.find params[:id]
    if @user.update(user_params)
      format.html { redirect_to :edit, notice: 'Account details successfully updated.' }
      format.json { render :edit }
    else
      format.html { redirect_to :edit }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

def user_params
  params.require(:user).permit(:name, :first_name, :middle_name, :last_name, :email, :password, :salt, :encrypted_password)
end

end
