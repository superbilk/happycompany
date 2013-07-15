# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  provider         :string(255)
#  uid              :string(255)
#  name             :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  email            :string(255)
#  company          :string(255)
#  image_mini_thumb :string(255)
#

class User < ActiveRecord::Base
  before_save :add_company

  def self.from_omniauth(auth)
    user = where(auth.slice("provider", "uid")).first || User.new
    user.assign_from_omniauth(auth)
    user.save if user.changed?
    user
  end

  def colleagues_count
    User.where("company == ?", self.company).count()-1
  end

  def colleagues
    User.where("company == ?", self.company).where("id != ?", self.id)
  end

  def assign_from_omniauth(auth)
    self.provider ||= auth["provider"]
    self.uid ||= auth["uid"]
    self.name = auth["info"]["name"]
    self.email = auth["info"]["email"]
    self.image = auth["info"]["image"]
    self
  end

private

  def add_company
    self.company = self.email.match(/@(.*)$/)[1]
  end

end
