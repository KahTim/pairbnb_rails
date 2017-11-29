class ListingsController < ApplicationController
	def index
		@listings = Listing.order(:name).page(params[:page]).per(10)
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = current_user.listings.new(listing_params)
		
		if @listing.save
			redirect_to root_url
		else
			redirect_to new_user_listing_path(current_user.id)
		end
	end

	private 

	def listing_params
		params.require(:listing).permit(:name, :place_type, :property_type, :price, {photos: []})
	end

end
