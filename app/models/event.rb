class Event < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :comments

	has_attached_file :event_img, styles: { event_index: "300x150>", event_show: "600x300>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :event_img, content_type: /\Aimage\/.*\z/


    def self.search_by(search_term)
    	where("LOWER(title) LIKE :search_term", search_term: "%#{search_term.downcase}%")
    end

end
