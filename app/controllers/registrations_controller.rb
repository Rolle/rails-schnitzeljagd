class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(params[:registration])
    @registration.request = request
    if @registration.deliver
      flash.now[:notice] = 'Vielen Dank für Eure Anmeldung. Sobald wir diese bearbeitet haben und die Startgebühr auf unserem Konto eingegangen ist, werden wir Euch benachrichtigen.'
    else
      flash.now[:error] = 'Anmeldung konnte nicht durchgeführt werden.'
    end
    render :new
  end
end