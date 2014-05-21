class QueryController < ApplicationController
  def index
    q = params[:search_type]

    if q=='Search for Societies'
      @societies = Society.search(params[:search]).order("created_at DESC")
    elsif q=='Search for Events Hosted by'
      #for now
      #@events = Event.all
      #@events = Event.host_search(params[:search])
      @z = Society.search(params[:search])
      #@events = @z.events

      #@events = Event.find_by_sql("SELECT * FROM events NATURAL JOIN societies")

      @events = []
      @z.each do |soc|
        @events += soc.events
      end
      #@events = (Society.search(params[:search])).events
      #@events = society.events
      #@events = Event.all(:include => :society)


    else
      if params[:search]
        @events = Event.search(params[:search]).order("created_at DESC")
        #@events = Event.search(params[:search])
      else
        @events = Event.all
      end
    end
  end
end