class Contact < ActiveRecord::Base
  attr_accessor :validated

  before_validation :set_validated

  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true, length: { minimum: 5 }     #:validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  validates :message, presence: true, length: { minimum: 10 }

  private

  def set_validated
    self.validated = true
  end  
end