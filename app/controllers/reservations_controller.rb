class ReservationsController < ApplicationController

	def new
		@reservation = Reservation.new
	end

	def create
		@reservation = current_user.reservations.new(reservation_params)
		
		if @reservation.save
			redirect_to root_url
		else
			redirect_to new_user_listing_path(current_user.id)
		end
	end

	private 

	def reservation_params
		params.require(:reservation).permit(:name, :email, :password, :avatar)
	end

end
