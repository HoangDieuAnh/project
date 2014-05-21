class SocietiesController < ApplicationController
  before_action :set_society, only: [:show, :edit, :update, :destroy]

  # GET /societies
  # GET /societies.json
  def index
    if params[:search]
      @societies = Society.search(params[:search]).order("created_at DESC")
    else
      @societies = Society.all
    end
  end

  # GET /societies/1
  # GET /societies/1.json
  def show
  end

  # GET /societies/new
  def new
    session[:society_params] ||= {}
    @society= Society.new(session[:society_params])
    @society.current_step = session[:society_step]
    @society.get_user

  end

  # GET /societies/1/edit
  def edit
  end

  # POST /societies
  # POST /societies.json
  def create
    session[:society_params].deep_merge!(society_params) if society_params &&session[:society_params]
    @society =Society.new(session[:society_params])

      @society.current_step = session[:society_step]

      if @society.valid?
        if params[:back_button]
          @society.previous_step
        elsif @society.last_step?
          @society.save if @society.all_valid?
        else
          @society.next_step
        end
        session[:society_step] = @society.current_step
      end
      if @society.new_record?
        render "new"
      else
        session[:society_step] = session[:society_params] = nil
        flash[:notice] = "Registration is pending, we will confirm as soon as possible!"
        render 'show'
      end
  end
  
  # PATCH/PUT /societies/1
  # PATCH/PUT /societies/1.json
  def update
    respond_to do |format|
      if @society.update(society_params)
        format.html { redirect_to @society, notice: 'Society was successfully updated.' }
        format.json { render :show, status: :ok, location: @society }
      else
        format.html { render :edit }
        format.json { render json: @society.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /societies/1
  # DELETE /societies/1.json
  def destroy
    @society.destroy
    respond_to do |format|
      format.html { redirect_to societies_url, notice: 'Society was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_society
      @society = Society.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def society_params
      params.require(:society).permit(:name, :regNum, :website, :approved, :relationships_attributes, :user_id, :relationships_attributes=>
        [:position,:firstname, :middlename, :lastname, :phone, :email, :society_id], :user_attributes =>[:name, :first_name, :middle_name, 
          :last_name, :email, :password,:password_confirmation])
    end
end
