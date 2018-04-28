require 'switch'

describe Switch do
  it 'is off by default' do
    switch = Switch.new

    expect(switch.on?).to be(true)
  end

  it 'sets switch off' do
    switch = Switch.new
    switch.turn_off

    expect(switch.on?).to be(false)
  end

  it 'sets switch on' do
    switch = Switch.new
    switch.turn_off
    switch.turn_on

    expect(switch.on?).to be(true)
  end
end
