class RegistrationsController < ApplicationController
  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(params[:registration])
    @registration.request = request
    if @registration.deliver
      flash.now[:notice] = 'Thank you for your registration. We will contact you soon!'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end