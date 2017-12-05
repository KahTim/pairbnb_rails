class ReservationsController < ApplicationController

	def new
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.new
		@error = false
	end

	def create
		# @reservation = current_user.listings.reservations.new(reservation_params)
		@reservation = Reservation.new(reservation_params)
		@reservation.user_id = current_user.id
		@listing = Listing.find(params[:listing_id])
		@reservation.listing_id = @listing.id
		if @reservation.save
			redirect_to braintree_new_path
		else
			# @errors = @reservation.errors.messages
			# byebug
			flash[:danger] = @reservation.errors.messages
			render "reservations/new"
			# redirect_to new_user_listing_reservation_path(user_id: current_user.id, listing_id: @listing.id)
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy!
		redirect_to root_url
	end

	private 

	def reservation_params
		params.require(:reservation).permit(:start_date, :end_date)
	end

end
