class RegistrationsController < ApplicationController
  respond_to :html, :js

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy
    respond_with @registration
  end

  def new
    @registration = Registration.new
  end

  def index
    if (user_signed_in?)
      @registrations = Registration.all.order("lastname")
    else
      @registrations = Registration.where("paid = 't'").order("lastname")
    end
  end

  def paid
    @registration = Registration.find(params[:id])
    @registration.update_attribute(:paid, !@registration.paid)
    render :nothing => true
  end

  def create
    @registration = Registration.new(registration_params)
    
    if @registration.save
      flash.now[:notice] = 'Vielen Dank für die Anmeldung. Sobald wir diese bearbeitet haben, werden wir eine Email als Bestätigung versenden.'
      RegistrationMailer.new_registration_mail(@registration).deliver
    else
      flash.now[:error] = 'Anmeldung konnte nicht durchgeführt werden.'
    end

    render :new
  end

  private
  def registration_params
    params.require(:registration).permit(:firstname,:lastname, :street, :zipcode, :town, :teamname, :email, :number, :members)
  end  
end