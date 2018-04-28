class Switch
  def initialize
    @on = true
  end

  def on?
    @on
  end

  def turn_on
    @on = true
  end

  def turn_off
    @on = false
  end
end
