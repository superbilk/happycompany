class UsersController < ApplicationController

  def show_company
    unless params[:show_company].nil?
      user = current_user
      user.show_company = params[:show_company]
      user.save
      end
  end

  def show
    redirect_to root_url unless current_user
  end

  def destroy
    current_user.destroy
    redirect_to signout_url
  end

end

