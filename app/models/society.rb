class Society < ActiveRecord::Base
  default_scope {order('updated_at DESC')}
	has_many :events, dependent: :destroy
	has_many :relationships,  dependent: :destroy
	belongs_to :user
    accepts_nested_attributes_for :events, :relationships, :user


    validates :name, :presence => true, :uniqueness => true
   attr_writer :current_step
  def current_step
    @current_step || steps.first
  end
  
  def steps
    %w[club bearer]
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

 def self.search(search)
  if search
    Event.where('name LIKE ? OR website LIKE ? OR description LIKE ?', 
      "%#{search}%","%#{search}%","%#{search}%")
  else
    vent.all()
  end
end
  def get_relationships
  	2.times { self.relationships.build }
       
    end
  def get_user
  	self.build_user
       
     end
end
