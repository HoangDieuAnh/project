class Event < ActiveRecord::Base
  default_scope {order('updated_at DESC')}
	has_many :event_pictures, :dependent => :destroy
  has_many :tickets, :foreign_key => 'event_id', :dependent => :destroy
  has_many :reservations, :through=> :tickets
	accepts_nested_attributes_for :event_pictures, :tickets
  #accepts_nested_attributes_for :tickets, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  validates :description, :presence => true,:length => { :in => 3..1000}
  validates :title, :presence => true, :length => { :in => 3..70 }
  validates :eventDate, :presence => true
  validates :venue, :presence => true, :length => { :in => 3..50 }
	   #password_confirmation attr
  # support multiple pages form when create an event, credit to http://railscasts.com/ 
  attr_writer :current_step
  def current_step
    @current_step || steps.first
  end
  def first
    @current_step=steps.first
  end

  def steps
    %w[ pict ticket]
  end
  
  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end
  
  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end
  
  def first_step?
    current_step == steps.first
  end
  
  def last_step?
    current_step == steps.last
  end
  
  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end

  # create a space for pictures' attributes
  def pictures_for_event
    3.times { self.event_pictures.build }
  # create a space for tickets' attributes
  end
  def tickets_for_event
    self.tickets.build
  end

def self.search(search)
  if search
    Event.where('title LIKE ? OR eventType LIKE ? OR eventDate LIKE ? OR venue LIKE ? OR eventTime LIKE ? OR description LIKE ?', 
      "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%")
  else
    Event.all()
  end
end
# check if user is an admin of the event or not, return false if not
def admin(user_id)
  if !user_id.nil?
    society=Society.find_by user_id:user_id 
    if !society.nil? 
      return society.id==self.society_id
    end
    
  else
    return false
    end
  end 
  
end