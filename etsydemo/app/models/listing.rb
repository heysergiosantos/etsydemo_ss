class Listing < ActiveRecord::Base

	has_attached_file :image,
					  :styles => {:medium => "200x200", :thumb => "100x100"},
					  :default_url => ActionController::Base.helpers.asset_path('missing.jpg'),
					  :s3_credentials => "#{Rails.root}/config/s3.yml",
					  :url => ':s3_domain_url',
					  :path => '/:class/:attachment/:id_partition/:style/:filename'

	validates_attachment_content_type :image, 
									   content_type: /\Aimage\/.*\Z/
end