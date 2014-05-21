class UserController < ApplicationController
#before_filter :save_login_state, :only => [:new, :create]
before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    render 'new'
  end

  # GET /users/1/edit
  def edit
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
# DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
def user_params
  params.require(:user).permit(:name, :first_name, :middle_name, :last_name, :email, :password, :salt, :encrypted_password)
end

end
