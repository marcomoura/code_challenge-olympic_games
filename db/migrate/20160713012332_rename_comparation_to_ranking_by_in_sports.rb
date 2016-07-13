class RenameComparationToRankingByInSports < ActiveRecord::Migration
  def change
    rename_column :sports, :comparison_operator, :ranking_calculator_strategy
  end
end
