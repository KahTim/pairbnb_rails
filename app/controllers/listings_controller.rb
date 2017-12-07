class ListingsController < ApplicationController
	
	def index
		x = params[:search]
		id = params[:user_id]
		if x
			@listings = Listing.where(["name LIKE ?", "%#{params[:search]}%"]).order(:name).page(params[:page]).per(10)
		else
			if id
				@listings = current_user.listings.order(:name).page(params[:page]).per(10)
			else
				@listings = Listing.order(:name).page(params[:page]).per(10)
			end
		end
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

	def show
		id = params[:id]
		@listing = Listing.find(id)
	end

	def edit
		id = params[:id]
		@listing = Listing.find(id)
	end

	def update
		id = params[:id]
		@listing = Listing.find(id)
			if @listing.update_attributes(listing_params)
				redirect_to listing_path(@listing.id)
			else
				redirect_to edit_user_listing_path(@listing.id)
			end
	end

	private 

	def listing_params
		params.require(:listing).permit(:name, :place_type, :property_type, :price, {photos: []})
	end

end
