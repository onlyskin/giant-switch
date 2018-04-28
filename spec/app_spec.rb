require 'app'
require 'rack'
require 'switch'

describe App do
  before(:each) do
    @switch = Switch.new
    app = App.new(@switch)
    @mock_request = Rack::MockRequest.new(app)
  end

  it 'GET to api/switch returns true when switch on' do
    response = @mock_request.get('api/switch')

    expect(response.status).to eq(200)
    expect(response.get_header('Content-Type')).to eq('application/json')
    expect(response.body).to eq('{"on":true}')
  end

  it 'GET to api/switch returns false when switch off' do
    @switch.turn_off

    response = @mock_request.get('api/switch')

    expect(response.status).to eq(200)
    expect(response.get_header('Content-Type')).to eq('application/json')
    expect(response.body).to eq('{"on":false}')
  end

  it 'PUT with on=false to api/switch turns switch off' do
    response = @mock_request.put('api/switch', :params => {:on => false})

    expect(@switch.on?).to be(false)
    expect(response.status).to eq(200)
    expect(response.get_header('Content-Type')).to eq('application/json')
    expect(response.body).to eq('{"on":false}')
  end

  it 'PUT with on=false to api/switch leaves switch off' do
    @switch.turn_off
    response = @mock_request.put('api/switch', :params => {:on => false})

    expect(@switch.on?).to be(false)
    expect(response.status).to eq(200)
    expect(response.get_header('Content-Type')).to eq('application/json')
    expect(response.body).to eq('{"on":false}')
  end

  it 'other methods return 405' do
    response = @mock_request.delete('api/switch', :on => false)

    expect(@switch.on?).to be(true)
    expect(response.status).to eq(405)
  end

  it 'GET to other urls returns 404' do
    response = @mock_request.get('')

    expect(response.status).to eq(404)
  end
end
