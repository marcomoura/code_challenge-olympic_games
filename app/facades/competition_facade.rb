class CompetitionFacade
  class << self
    def create(options)
      options[:athletes_attributes] = options.delete 'athletes' if options.key? 'athletes'
      options[:sport_name] = options.delete 'sport' if options.key? 'sport'
      Competition.create! options
    end

    def add_result(id, options)
      item = competition id
      raise FinishedError if item.finished?

      attributes = UpdateAttributesAdapter.adapt id, options

      item.update attributes
    end

    def finish(id)
      competition(id).finished!
    end

    def ranking(id)
      competition = competition id
      ranking = RankingCalculatorStrategy.compute competition.results,
                                                  competition.ranking_calculator_strategy

      [competition.status, ranking]
    end

    def competition(id)
      Competition.find id
    end
  end
end
