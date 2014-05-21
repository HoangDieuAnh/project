class EventPicture < ActiveRecord::Base
	belongs_to :event
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	# Validate content type
    #validates_attachment_content_type :image, :content_type => /\Aimage/

    # Validate filename
    #validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/]

    # Explicitly do not validate
    #do_not_validate_attachment_file_type :image
end
