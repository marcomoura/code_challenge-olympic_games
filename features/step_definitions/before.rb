Before do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

  Sport.create name: 'corrida', comparison_operator: :lesser
  Sport.create name: 'dardo'
end
