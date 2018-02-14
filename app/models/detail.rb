class Detail < ApplicationRecord
	has_attached_file :image, styles: { :large => "600*600>", :thumb => "150*150>", :medium => "250*250>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	belongs_to :user
end
