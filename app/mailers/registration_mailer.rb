class RegistrationMailer < ActionMailer::Base
  default from: "rolle@rolandschmitt.info"

  def new_registration_mail(registration)
  	@registration = registration
  	mail(to: 'info@mtb-schnitzeljagd.de', subject: "Anmeldung: " + @registration.teamname.first(30))
  end
end
