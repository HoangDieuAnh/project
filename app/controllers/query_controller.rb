class QueryController < ApplicationController
  def index
    q = params[:search_type]
     
       if q=='Search for Societies' 
          @societies = Society.search(params[:search])
          #@societies = Society.paginate(:page => params[:page], :per_page => 4)

       else
          @events = Event.search(params[:search])
          #@events = Event.paginate(:page => params[:page], :per_page => 4)

       end

  end
end