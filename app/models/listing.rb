class Listing < ApplicationRecord
	belongs_to :user
	mount_uploaders :photos, PhotoUploader
	has_many :reservations
 

	PLACE_TYPE_OPTIONS = [ "Landed", "Condo", "Apartment"]

end
