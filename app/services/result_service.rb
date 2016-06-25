class ResultService
  def self.ranking(results, comparison_operator = 'greater')
    new(results, comparison_operator).ranking
  end

  def initialize(results, operator)
    @results = results
    @comparable = operator.eql?('greater') ? :max : :min
  end

  def ranking
    result = filter_and_order
    return result.reverse if @comparable.eql? :max
    result
  end

  private

  def filter_and_order
    @results
      .group_by(&:athlete_code)
      .collect { |_, s| s.send(@comparable) { |a, b| a.score <=> b.score } }
      .sort_by(&:score)
  end
end
