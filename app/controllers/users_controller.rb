class UsersController < ApplicationController
before_filter :set_user, :only => [:show, :edit, :update]
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
    redirect_to :controller=> 'users', :action => 'show', :id=>@user.id
  else
    flash[:notice] = "Form is invalid"
    flash[:color]= "invalid"
    render 'new'
  end
end

def show
  if @user.present?
    @Allevents=Event.all
    @events=Event.joins(:tickets => :reservations).where(:reservations => {:user_id => @user.id})
    @Allevents = Event.paginate(:page => params[:page], :per_page => 4)

    
  end

end

def edit
end

def update
  
    if @user.update(user_params)
      flash[:notice] = "You updated successfully"
      flash[:color]= "valid"
      redirect_to :controller=>"users", :action=>"show", :id=>@user.id
    else
      flash[:notice] = "Sorry, something goes wrong"
      flash[:color]= "invalid"
      render 'edit'
      
    end
 
end
private 
def user_params
  params.require(:user).permit(:name, :first_name, :middle_name, :last_name, :email, :password, :salt, :password_confirmation, :phone, :mobile)
end
private
def set_user
  @user=User.find(params[:id])
end

end
