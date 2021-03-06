# == Schema Information
#
# Table name: sports
#
#  id                          :integer          not null, primary key
#  name                        :string(50)       not null
#  ranking_calculator_strategy :integer          default(0), not null
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

class Sport < ActiveRecord::Base
  has_many :competitions

  enum ranking_calculator_strategy: %i(highest_score lowest_score)

  validates :name,
            presence: true,
            length: { maximum: 50, allow_blank: true },
            uniqueness: { case_sensitive: false, allow_blank: true }
end
