class ReservationMailer < ApplicationMailer

	default from: 'layman121234@gmail.com'

	def booking_email(customer, host, reservation_id)
  	@customer = customer
  	@host = host
  	@reservation_id = reservation_id
  	# byebug
   #  @url  = 'http://example.com/login'
    mail(to: @host.email, subject: 'Welcome to My Awesome Site')
  end
end
