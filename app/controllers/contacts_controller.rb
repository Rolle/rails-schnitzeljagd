class ContactsController < ApplicationController
  respond_to :html, :js, :json
  before_action :authenticate_user!, only: :index

  def destroy
    @contact = Contact.find(params[:id])
    respond_with @registration
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save!
      flash.now[:notice] = 'Vielen Dank für deine Nachricht! Wir versuchen, dir umgehend zu antworten.'
      ContactMailer.new_contact_mail(@contact).deliver
    else
      flash.now[:error] = 'Nachricht konnte nicht gesendet werden.'      
    end
    render :new
  end

  def index
    @contacts = Contact.all.order("created_at desc")
  end

  def answered
    @contact = Contact.find(params[:id])
    @contact.update_attribute(:answered, !@contact.answered)
    render :nothing => true
  end

  private
  def contact_params
    params.require(:contact).permit(:name,:email, :message)
  end  
end
