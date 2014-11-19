class ContactMailer < ActionMailer::Base
  default from: "rolle@rolandschmitt.de"

  def new_contact_mail(contact)
  	@contact = contact
  	mail(to: 'rolle@rolandschmitt.info', subject: @contact.message.first(30))
end
