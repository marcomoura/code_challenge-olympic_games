require 'json'

Então(/^devo obter o status (\d+)$/) do |code|
  expect(last_response.status).to eq code.to_i
end

Então(/^(?:devo )?obter os dados:$/) do |body|
  expect(parse_json(last_response.body)).to eq parse_json(body)
end

def parse_json(string)
  JSON.parse string
end
