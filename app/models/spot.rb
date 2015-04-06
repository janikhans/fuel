class Spot < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	has_many :comments
	has_attached_file :image, styles: {thumb: "400x400>", large: "1024x768>"}, :convert_options => {
    :thumb => "-quality 95 -strip -unsharp 1.5x1+0.7+0.02" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end

