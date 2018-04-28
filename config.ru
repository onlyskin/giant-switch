require_relative 'lib/app'
require_relative 'lib/switch'
use Rack::Reloader

app = App.new(Switch.new)
run app
