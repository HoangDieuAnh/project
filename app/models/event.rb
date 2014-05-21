class Event < ActiveRecord::Base
    default_scope {order('updated_at DESC')}
	has_many :event_pictures, :dependent => :destroy
  has_many :tickets, :foreign_key => 'event_id', :dependent => :destroy
		accepts_nested_attributes_for :event_pictures, :tickets
    #accepts_nested_attributes_for :tickets, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
   validates :title, :presence => true, :length => { :in => 3..20 }
  validates :eventDate, :presence => true
   validates :venue, :presence => true, :length => { :in => 3..20 }
	   #password_confirmation attr

    attr_writer :current_step
  def current_step
    @current_step || steps.first
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


    def pictures_for_event
        3.times { self.event_pictures.build }
       
     end
     def tickets_for_event
        self.tickets.build
     end

  def self.search(query)
    where("title like ? OR description LIKE ? OR eventType LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%")
  end
end

  