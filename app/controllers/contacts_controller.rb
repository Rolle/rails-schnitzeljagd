class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Vielen Dank für deine Nachricht! Wir versuchen, dir umgehend zu antworten.'
    else
      flash.now[:error] = 'Nachricht konnte nicht gesendet werden.'      
    end
    render :new
  end
end