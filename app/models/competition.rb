# == Schema Information
#
# Table name: competitions
#
#  id         :integer          not null, primary key
#  status     :integer          default(0), not null
#  sport_name :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Competition < ActiveRecord::Base
  has_many :athletes, inverse_of: :competition
  has_many :results, through: :athletes
  belongs_to :sport, primary_key: :name, foreign_key: :sport_name

  accepts_nested_attributes_for :athletes

  enum status: %i(in_progress finished)

  validates_presence_of :sport_name, :athletes
end
