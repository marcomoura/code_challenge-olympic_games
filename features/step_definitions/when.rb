Quando %r{^(?:que )?(?:envio )?um (POST|PUT) para (\/.*?) com os dados:$} do |method, path, body|
  request path, method: method.downcase.to_sym, input: StringIO.new(body)
end

Quando %r{^(?:que )?(?:envio )?um (DELETE|GET) para (\/.*?)$} do |method, path|
  request path, method: method.downcase.to_sym
end
