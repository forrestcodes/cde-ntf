class PagesController < ApplicationController
  def home
    redirect_to new_registration_path unless session[:current_user_email].present?
  end
end