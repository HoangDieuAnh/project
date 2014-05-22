class QueryController < ApplicationController
  def index
    q = params[:search_type]
     
       if q=='Search for Societies' 
          @societies = Society.search(params[:search])
       else
          @events = Event.search(params[:search])
       end
  end
end