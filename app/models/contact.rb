class Contact < MailForm::Base
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  before_validation :set_validated

  attribute :name,      :validate => true
  attribute :email#,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message, :validate => true
  attribute :validated

  validates :name, length: { minimum: 3 }
  validates :email, length: { minimum: 5 }
  validates :message, length: { minimum: 10 }

  def headers
    {
      :subject => "Schnitzeljagd 2015 - Nachricht",
      :to => "roland.schmitt@web.de",
      :from => %("#{name}" <#{email}>)
    }
  end

  private

  def set_validated
    self.validated = true
  end  
end