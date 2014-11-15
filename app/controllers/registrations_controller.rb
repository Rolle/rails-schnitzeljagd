class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end

  def create
    #@image_artifact = ImageArtifact.new(image_artifact_params)
    @registration = Registration.new(registration_params)
    
    if @registration.save!
      flash.now[:notice] = 'Vielen Dank für Eure Anmeldung. Sobald wir diese bearbeitet haben und die Startgebühr auf unserem Konto eingegangen ist, werden wir Euch benachrichtigen.'
    else
      flash.now[:error] = 'Anmeldung konnte nicht durchgeführt werden.'
    end

    #if @registration.deliver
    #  flash.now[:notice] = 'Vielen Dank für Eure Anmeldung. Sobald wir diese bearbeitet haben und die Startgebühr auf unserem Konto eingegangen ist, werden wir Euch benachrichtigen.'
    #else
    #  flash.now[:error] = 'Anmeldung konnte nicht durchgeführt werden.'
    #end
    render :new
  end

  private
  def registration_params
    params.require(:registration).permit(:firstname,:lastname, :street, :zipcode, :town, :teamname, :email, :number, :members)
  end  
end