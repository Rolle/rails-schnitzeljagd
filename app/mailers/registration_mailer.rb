class RegistrationMailer < ActionMailer::Base
  default from: "rolle@rolandschmitt.info"

  def new_registration_mail(registration)
  	@registration = registration
  	mail(to: 'rolle@rolandschmitt.info', subject: @registration.teamname.first(30))
  end
end
