module ApplicationHelper
def site_name
    # Change the value below between the quotes.
    "ClubBiz"
  end
def find_related(t_id, user_id)
   @reservation=Reservation.where(:ticket_id =>t_id).where(:user_id=>user_id).first
   return @reservation.present?
end
    def booked(user_id, ticket_id)
       ticket_booked=Reservation.where(:ticket_id =>ticket_id).where(:user_id=>user_id).first
       return !ticket_booked.blank?
  end
  def site_url
    if Rails.env.production?
      # Place your production URL in the quotes below
      "http://www.ClubBiz.com/"
    else
      # Our dev & test URL
      "http://localhost:3000"
    end
  end

  def meta_author
    # Change the value below between the quotes.
    "Victor Dilks_Hoang Dieu Anh Nguyen_Hoang Phuc Pham"
  end

  def meta_description
    # Change the value below between the quotes.
    "Assignment part3"
  end

  def meta_keywords
    # Change the value below between the quotes.
    "ClubBiz"
  end

  # Returns the full title on a per-page basis.
  # No need to change any of this we set page_title and site_name elsewhere.
  def full_title(page_title)
    if page_title.empty?
      site_name
    else
      "#{page_title} | #{site_name}"
    end
  end
  def authenticate_user
    if session[:user_id]
     # set current user object to @current_user object variable
      @current_user = User.find session[:user_id] 
      return true 
    else
      return false
    end
  end
  def admin(user_id, society_id)
    society=Society.find(society_id)
    return user_id==society.user_id
  end
  def is_admin(id)
    @society=Society.find_by user_id:id
    return @society.present?
  end
end
