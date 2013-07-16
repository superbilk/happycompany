class UserController < ApplicationController

  def show_company
    unless params[:show_company].nil?
      user = current_user
      user.show_company = params[:show_company]
      user.save
    end
  end

end
