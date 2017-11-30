class Listing < ApplicationRecord
	belongs_to :user
	mount_uploaders :photos, PhotoUploader
	has_many :reservation_relationships, class_name:"Reservation", foreign_key:"user_id"
  has_many :bookings, through: :reservation_relationships, source: :user

	PLACE_TYPE_OPTIONS = [ "Landed", "Condo", "Apartment"]

end
