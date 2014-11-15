class Registration < ActiveRecord::Base #< MailForm::Base

  attr_accessor :validated
  
  validates :firstname,      presence: true,length: { minimum: 3 }
  validates :lastname,      presence: true,length: { minimum: 3 }
  validates :street,      presence: true, length: { minimum: 5 }
  validates :number,      presence: true
  validates :zipcode,      presence: true
  validates :town,      presence: true, length: { minimum: 3 }

  validates :email, presence: true #,     format: {with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, "nur gültige Mail-Adressen"}
  validates :teamname, presence: true, length: { minimum: 5 }
  validates :members, presence: true, length: { minimum: 5 }

  before_validation :set_validated

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Schnitzeljagd 2015 - Anmeldung",
      :to => "rolle@rolandschmitt.info",
      :from => %("#{firstname} #{lastname}" <#{email}>)
    }
  end

  private
  def set_validated
    self.validated = true
  end
end