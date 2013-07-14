class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(auth_hash)
    session[:user_id] = user.id
    redirect_to root_url, notice: "Hallo #{user.name}!"
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Abgemeldet"
  end

protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
