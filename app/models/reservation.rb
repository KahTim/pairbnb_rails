class Reservation < ApplicationRecord

	belongs_to :user
	belongs_to :listing
	before_save :duration_method

	validate :date_logic, :past_date, :check_overlapping_dates

	def check_overlapping_dates
	    # compare this new booking againsts existing bookings
	    listing.reservations.each do |old_booking|
	      if overlap?(self, old_booking)
	        return errors.add(:overlapping_dates, "The booking dates conflict with existing bookings")
	      end
	    end

	 end

 	def overlap?(x,y)
    (x.start_date - y.end_date) * (y.start_date - x.end_date) > 0
  end

	def date_logic
		if self.start_date == self.end_date || self.start_date > self.end_date
			return errors.add(:end_date, "can't be same/before start date")
		end
	end

	def past_date
		if self.start_date < Date.today
			return errors.add(:start_date, "can't be in the past")
		end
	end

	def duration_method
		self.duration= self.end_date - self.start_date
	end

end
