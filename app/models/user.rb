# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  provider     :string(255)
#  uid          :string(255)
#  name         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  email        :string(255)
#  company      :string(255)
#  image        :string(255)
#  show_company :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  has_many :votes
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

  def self.all_companies
    User.where("show_company == ?", true).uniq.pluck(:company)
  end

  def assign_from_omniauth(auth)
    self.provider ||= auth["provider"]
    self.uid ||= auth["uid"]
    self.name = auth["info"]["name"]
    self.email = auth["info"]["email"]
    self.image = auth["info"]["image"]
    self.business_email = auth["extra"]["raw_info"]["business_address"]["email"]
    self
  end

private

  def add_company
    self.company = self.business_email.match(/@(.*)$/)[1]
  end

end
