class Recipe < ActiveRecord::Base


	validates :title, presence: true, uniqueness: true

	def self.search(query)
		where("title like ?", "%#{query}%")
	end
	
end
