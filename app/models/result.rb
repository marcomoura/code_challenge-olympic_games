# == Schema Information
#
# Table name: results
#
#  id           :integer          not null, primary key
#  athlete_code :string           not null
#  score        :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Result < ActiveRecord::Base
  belongs_to :athlete, foreign_key: 'athlete_code', primary_key: 'code'

  validates :athlete, presence: true
  validates :score, numericality: { only_integer: true, allow_blank: true }
end
