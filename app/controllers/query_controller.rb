class QueryController < ApplicationController
  def index
    q = params[:search_type]
     if params[:search]
       if q=='Search for Societies' 
          @societies = Society.search(params[:search]).order("created_at DESC")
          redire
       else
          @events = Event.search(params[:search]).order("created_at DESC")
       end
     else
       if q=='Search for Societies' 
          @societies = Society.all
       elsif q=='Search for Events Hosted by'
          @events = Event.all
       end
    end

  end
end