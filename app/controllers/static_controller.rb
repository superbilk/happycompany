class StaticController < ApplicationController

  def dashboard
    @votes = current_user.votes.order("created_at DESC").limit(10)
    @company_votes = Vote.where(company: current_user.company).order("created_at DESC").group("user_id").distinct
  end

end
