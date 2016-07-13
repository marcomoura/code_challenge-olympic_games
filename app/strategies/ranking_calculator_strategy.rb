class RankingCalculatorStrategy
  def self.compute(scores, ranking_score_by = 'highest_score')
    new(ranking_score_by).compute scores
  end

  def initialize(ranking_score_by)
    @ranking_score_by = ranking_score_by
  end

  def compute(scores)
    ranking_score_strategy.new.compute(scores)
  end

  private

  def ranking_score_strategy
    @ranking_score_by.dup.concat('_calculator_strategy').classify.constantize
  end
end
