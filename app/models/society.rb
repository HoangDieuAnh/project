class Society < ActiveRecord::Base
	has_many :events, dependent: :destroy

  def self.search(query)
    where("name like ?", "%#{query}%")
  end

end
