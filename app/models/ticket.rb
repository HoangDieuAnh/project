class Ticket < ActiveRecord::Base
	belongs_to :event
	has_many :reservations, dependent: :destroy
	accepts_nested_attributes_for :reservations
	
	
end
