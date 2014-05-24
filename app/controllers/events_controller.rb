class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    if params[:search]
        @events = Event.search(params[:search]).order("created_at DESC")
    else
      @events = Event.all
    end
      @events = Event.paginate(:page => params[:page], :per_page => 4)

  end
  
  # GET /events/1
  # GET /events/1.json

  def show
    if @event.present?
      @ticket=Ticket.find_by event_id:@event.id
      if @ticket.present? && !@ticket.maxnumber.blank?
        ticket_sold=Reservation.where(ticket_id:@ticket.id).sum(:amount) 
        @available=@ticket.maxnumber-ticket_sold
        tick_avai=[4, @available].min
        @available_to_buy=[*1..tick_avai]
      end
    end
  end


  # GET /events/1/edit
  def edit
  end

  def search
    @events = Event.search params[:search]
  end

   
  # check if user is an admin of the event or not

  def validate 
    if session[:user_id].present?
      society=Society.find_by user_id:session[:user_id]
      return society.present?
    else
      return false
    end
  end

  # GET /events/new
  def new
      if validate
        @society=Society.find_by user_id:session[:user_id]
        # multiple pages form, save info in session so user can come back 
        #and see before submitting
        session[:event_params] ||= {}
        @event = Event.new(session[:event_params])
        @event.current_step=session[:event_step]
        @event.pictures_for_event
        @event.tickets_for_event
       
    else
        render "/public/_validateError"
     end

  end
  # POST /events
  # POST /events.json
  def create
    # store in session, support multiple pages form
    session[:event_params].deep_merge!(event_params) if event_params &&session[:event_params]
    @event = Event.new(session[:event_params])

    @event.current_step = session[:event_step]

      if @event.valid?
        if params[:back_button]
          @event.previous_step
        elsif @event.last_step?
          @event.save if @event.all_valid?
        else
          @event.next_step
        end
        session[:event_step] = @event.current_step
      end
      if @event.new_record?
        render "new"
      else
        session[:event_step] = session[:event_params] = nil
        flash[:notice] = "Order saved!"
        redirect_to :controller =>'events', :action=>'show', :id=>@event.id
      end
  end
  
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
      @society=Society.find(@event.society_id) if @event.present?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
        params.require(:event).permit(:title, :eventDate, :eventTime, :society_id,
        :venue, :eventType, :description, :event_pictures_attributes =>[:id,:event_id, :picturename], :tickets_attributes=>[:id,:event_id, :price, :startdate, :closedate, 
          :maxnumber, :description])
    end
end

