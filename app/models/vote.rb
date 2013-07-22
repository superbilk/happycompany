# == Schema Information
#
# Table name: votes
#
#  id             :integer          not null, primary key
#  grade          :integer
#  best           :text
#  worst          :text
#  recommendation :text
#  comment        :text
#  company        :string(255)
#  user_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Vote < ActiveRecord::Base
  belongs_to :user

  validates :grade, :inclusion => 1..6

  def self.monthly_avg_for_company(month, company)
    # Vote.where(company: company).where(strftime('%m', `date column`) = '04')count
  end
end
