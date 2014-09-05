class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email#,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message, :validate => true

  validates :name, length: { minimum: 3 }
  validates :email, length: { minimum: 5 }
  validates :message, length: { minimum: 10 }

  def headers
    {
      :subject => "Schnitzeljagd 2015 - Nachricht",
      :to => "your_email@example.org",
      :from => %("#{name}" <#{email}>)
    }
  end
end