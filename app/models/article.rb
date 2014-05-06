class Article < ActiveRecord::Base

	validates :title, presence: true, length: { minimum: 5 }
	validates :text, presence: true, length: { minimum: 5 }

	def self.search(query)
	  where("text LIKE ?", "%#{query}%")
	end

	def to_param
	    [id, title.parameterize, created_at.strftime("%m%d%Y")].join("-")
	end

end
