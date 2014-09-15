class Registration < MailForm::Base
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  attribute :firstname,      :validate => true
  attribute :lastname,      :validate => true
  attribute :street,      :validate => true
  attribute :number,      :validate => true
  attribute :zipcode,      :validate => true
  attribute :town,      :validate => true

  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i  
  attribute :teamname, :validate => true
  attribute :members, :validate => true

  attribute :validated
  
  validates :firstname, length: { minimum: 3 }
  validates :lastname, length: { minimum: 3 }
  validates :street, length: { minimum: 5 }
  validates :town, length: { minimum: 3 }
  validates :teamname, length: { minimum: 5 }
  validates :members, length: { minimum: 5 }

  before_validation :set_validated

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Schnitzeljagd 2015 - Anmeldung",
      :to => "your_email@example.org",
      :from => %("#{name}" <#{email}>)
    }
  end

  private
  def set_validated
    self.validated = true
  end
end