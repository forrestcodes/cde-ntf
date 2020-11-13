class RegistrationsController < ApplicationController
  def new
  end

  def create
    session[:current_user_email] = registration_params[:email]
    @name = registration_params[:name]
  end

  private

  def registration_params
    params.require(:registration).permit(:name, :email, :password)
  end
end