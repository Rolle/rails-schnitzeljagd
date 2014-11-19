class ContactMailer < ActionMailer::Base
  default from: "rolle@rolandschmitt.info"

  def new_contact_mail(contact)
  	@contact = contact
  	mail(to: 'rolle@rolandschmitt.info', subject: "Anfrage: " + @contact.message.first(30))
  end
end
