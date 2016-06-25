class CompetitionService
  class << self
    def create(options)
      options[:athletes_attributes] = options.delete 'athletes' if options.key? 'athletes'
      options[:sport_name] = options.delete 'sport' if options.key? 'sport'
      Competition.create! options
    end

    def add_result(id, options)
      item = competition(id)
      raise FinishedError if item.finished?

      attributes = UpdateAttributesDecorator.decorate(id, options)

      item.update attributes
    end

    def finish(id)
      competition(id).finished!
    end

    def ranking(competition_id)
      competition = competition competition_id
      results = ResultService.ranking competition.results, competition.sport.comparison_operator

      [competition.status, results]
    end

    def competition(id)
      Competition.find id
    end
  end

  class FinishedError < StandardError; end
end
