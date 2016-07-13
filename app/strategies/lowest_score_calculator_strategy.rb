class LowestScoreCalculatorStrategy
  def compute(scores)
    scores
      .group_by(&:athlete_code)
      .collect { |_, s| s.min { |a, b| a.score <=> b.score } }
      .sort_by(&:score)
  end
end
