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
  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.company = auth["info"]["email"][/@(.*)$/,1]
      user.image_mini_thumb = auth["extra"]["raw_info"]["photo_urls"]["mini_thumb"]
    end
  end

  def colleagues_count
    User.where("company == ?", self.company).count()
  end

end
