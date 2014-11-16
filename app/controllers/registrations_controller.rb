class RegistrationsController < ApplicationController
  respond_to :html, :js, :json
  before_action :authenticate_user!, only: :index

  def new
    @registration = Registration.new
  end

  def index
    @registrations = Registration.all.order("created_at")
  end

  def paid
    @registration = Registration.find(params[:id])
    @registration.update_attribute(:paid, !@registration.paid)
    render :nothing => true
  end

  def create
    @registration = Registration.new(registration_params)
    
    if @registration.save!
      flash.now[:notice] = 'Vielen Dank für Eure Anmeldung. Sobald wir diese bearbeitet haben und die Startgebühr auf unserem Konto eingegangen ist, werden wir Euch benachrichtigen.'
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