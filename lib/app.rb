require 'json'

class App
  def call(env)
    path = env.fetch('PATH_INFO')
    if path == '/api/switch'
      [
        200,
        {'Content-Type' => 'application/json'},
        [JSON.generate({:on => true})],
      ]
    else
      [
        404,
        {'Content-Type' => 'text/html'},
        ['Not Found']
      ]
    end
  end
end
