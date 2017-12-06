class ReservationJob < ApplicationJob
  queue_as :default

  def perform(reservation) #work on this
  	@reservation = reservation
  	# x = Reservation.last
  	y = Listing.find(@reservation.listing_id)
  	ReservationMailer.booking_email(User.find(@reservation.user_id), User.find(y.user_id), @reservation.id).deliver_now
    # Do something later
  end
end
