# == Schema Information
#
# Table name: athletes
#
#  id             :integer          not null, primary key
#  name           :string(50)       not null
#  code           :string(50)       not null
#  competition_id :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Athlete < ActiveRecord::Base
  has_many :results, foreign_key: 'athlete_code', primary_key: 'code', counter_cache: true
  belongs_to :competition, inverse_of: :athletes
  has_one :sport, through: :competition

  accepts_nested_attributes_for :results

  validates :competition,
            presence: true

  validates :name,
            presence: true,
            length: { maximum: 50, allow_blank: true }

  validates :code,
            presence: true,
            length: { maximum: 50, allow_blank: true },
            uniqueness: { scope: :competition_id, allow_blank: true }

  validates :results,
            length: { in: 1..3, allow_blank: true }
end
