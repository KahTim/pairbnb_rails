class ListingsController < ApplicationController
	def index
		@listings = Listing.order(:name).page(params[:page]).per(10)
	end
end
