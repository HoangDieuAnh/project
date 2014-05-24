class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    ticket_id=params[:reservation][:ticket_id]
    #calculate the available number of tickets
    ticket_sold=Reservation.where(ticket_id:ticket_id).sum(:amount) 
    available=Ticket.find(ticket_id).maxnumber-ticket_sold
    if available>=params[:reservation][:amount].to_f

      @reservation = Reservation.new(reservation_params)
    
    
      if @reservation.save
        event_id=Ticket.find(ticket_id).event_id
        redirect_to :controller=>'events', :action=>'show', :id=>event_id
      else
        flash[:notice]="an error occur, please try again"
        redirect_to :controller=>'events', :action=>'show',:id=>event_id, :notice=>"an error occur, please try again"

      end
    else
      flash[:notice]="Sorry, you are too late!!!"

      redirect_to :controller=>'events', :action=>'show', :id=>event_id,:notice=>"Sorry, You couldn't make it."
    end
    
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    Reservation.delete(params[:id])
    redirect_to user_path(params[:user_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:ticket_id, :user_id, :amount)
    end
end
