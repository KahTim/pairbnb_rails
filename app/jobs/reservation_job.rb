class ReservationJob < ApplicationJob
  queue_as :default

  def perform(reservation) #work on this
  	x = Reservation.last
  	y = Listing.find(x.listing_id)
  	ReservationMailer.booking_email(User.find(x.user_id), User.find(y.user_id), x.id).deliver_now
    # Do something later
  end
end
