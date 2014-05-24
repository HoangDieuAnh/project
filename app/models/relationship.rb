class Relationship < ActiveRecord::Base
	belongs_to :society
	validates :position, :presence => true
    validates :email, :presence => true
	
end
