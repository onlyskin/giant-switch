require_relative 'lib/app'
use Rack::Reloader

app = App.new
run app
