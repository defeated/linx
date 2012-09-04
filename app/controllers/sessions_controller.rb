class SessionsController < ApplicationController
  EMAIL_PATTERN = /^[a-z0-9\-\.]+@litmus(app)?\.com$/i

  def create
    email = request.env["omniauth.auth"][:info][:email] rescue ""
    if email =~ EMAIL_PATTERN
      session[:admin_auth] = email
      redirect_to links_path
    else
      render text: "Sorry, access denied.", status: :forbidden
    end
  end

end
