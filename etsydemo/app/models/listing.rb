class Listing < ActiveRecord::Base

	has_attached_file :image,
					  :styles => {:medium => "200x200", :thumb => "100x100"},
					  :default_url => lambda { |image| ActionController::Base.helpers.asset_path('missing.jpg') }

	validates_attachment_content_type :image, 
									   content_type: /\Aimage\/.*\Z/

	validates :name, :description, presence: :true
	validates :price, numericality: { greater_than: 0 }
end