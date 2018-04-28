require 'app'
require 'rack'

describe App do
  it "get to api/switch returns true" do
    app = App.new

    mock_request = Rack::MockRequest.new(app)
    response = mock_request.get('api/switch')

    expect(response.status).to eq(200)
    expect(response.get_header('Content-Type')).to eq('application/json')
    expect(response.body).to eq('{"on":true}')
  end

  it "GET to other urls returns 404" do
    app = App.new

    mock_request = Rack::MockRequest.new(app)
    response = mock_request.get('')

    expect(response.status).to eq(404)
  end
end
