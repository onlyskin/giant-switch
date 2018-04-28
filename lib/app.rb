require 'json'

class App
  def initialize switch
    @switch = switch
  end

  def call env
    req = Rack::Request.new env
    if req.path == '/api/switch'
      switch_route req
    else
      not_found
    end
  end

  def switch_route req
    if req.get?
      switch_state_response
    elsif req.put?
      set_switch_state req
      switch_state_response
    else
      method_not_allowed
    end
  end

  def not_found
    [
      404,
      {'Content-Type' => 'text/html'},
      ['Not Found']
    ]
  end

  def method_not_allowed
    [
      405,
      {'Content-Type' => 'text/html'},
      ['Method Not Allowed']
    ]
  end

  def set_switch_state req
    new_state = req.params['on']
    if new_state == "true"
      @switch.turn_on
    elsif new_state == "false"
      @switch.turn_off
    end
  end

  def switch_state_response
    [
      200,
      {'Content-Type' => 'application/json'},
      [JSON.generate({:on => @switch.on?})],
    ]
  end
end
