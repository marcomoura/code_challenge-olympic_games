class HighestScoreCalculatorStrategy
  def compute(scores)
    scores
      .group_by(&:athlete_code)
      .collect { |_, s| s.max { |a, b| a.score <=> b.score } }
      .sort_by(&:score)
      .reverse
  end
end
