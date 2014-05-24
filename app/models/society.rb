class Society < ActiveRecord::Base
  default_scope {order('updated_at DESC')}
	has_many :events, dependent: :destroy
	has_many :relationships,  dependent: :destroy
  validates :description, :presence => true,:length => { :in => 3..1000}
  validates :name, :presence => true, :length => { :in => 3..100}
	belongs_to :user
  accepts_nested_attributes_for :events, :relationships, :user


  validates :name, :presence => true, :uniqueness => true
  # support multiple pages form when creating an event, credit to railcast.com
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
      Society.where('name LIKE ? OR website LIKE ?', 
      "%#{search}%","%#{search}%")
    else
      Society.all()
    end
  end
  def get_relationships
    2.times { self.relationships.build }
  end    
  def get_user
  	self.build_user   
  end
end
