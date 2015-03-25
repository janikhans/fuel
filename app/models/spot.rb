class Spot < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, styles: {large: "1024x768>", medium: "300x300>"}
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
