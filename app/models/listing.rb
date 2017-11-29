class Listing < ApplicationRecord
	belongs_to :user
	mount_uploaders :photos, PhotoUploader

	PLACE_TYPE_OPTIONS = [ "Landed", "Condo", "Apartment"]

end
