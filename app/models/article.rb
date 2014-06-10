class Article < ActiveRecord::Base

	validates :title, presence: true, length: { minimum: 5 }
	validates :text, presence: true, length: { minimum: 5 }

	DISQUS_SHORTNAME = Rails.env == "development" ? "mramirol".freeze : "mramirol".freeze

	def self.search(query)
	  where("text LIKE ?", "%#{query}%")
	end

	def to_param
	    [id, title.parameterize].join("-")
	end

end
