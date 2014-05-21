class PagesController < ApplicationController
  before_filter :authenticate_user, :only =>[:home]
  def home
    
  end
  def about
    
  end
  def contact
    
  end
  def terms
    
  end
  def privacy
    
  end
  
end
