Before do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

  Sport.create name: 'corrida', ranking_calculator_strategy: :lowest_score
  Sport.create name: 'dardo'
end
