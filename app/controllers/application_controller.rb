class ApplicationController < ActionController::Base
  helper_method :current_user_email

  def current_user_email
    session[:current_user_email]
  end
end
