class ApplicationController < ActionController::Base
  protect_from_forgery

  def admin_authenticate
    redirect_to "/auth/google" unless admin_logged_in?
  end

  def admin_logged_in?
    session[:admin_auth].present?
  end
end
