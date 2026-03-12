require_relative '../lib/freezer'

describe 'A freezer' do

  it 'has a capacity and temperature' do
    freezer = Freezer.new(100)
    expect(freezer.capacity).to eq(100)
    expect(freezer.temperature).to_not eq(nil)
  end

  it 'it initially powered off' do
    freezer = Freezer.new
    expect(freezer.get_power).to eq(:off)
  end

  it 'has its power on when turned on' do
    freezer = Freezer.new
    freezer.turn_on
    expect(freezer.get_power).to eq(:on)
  end

  it 'has its power off when turned off' do
    freezer = Freezer.new
    freezer.turn_on
    freezer.turn_off
    expect(freezer.get_power).to eq(:off)
  end

  it 'has a reduced capacity when an item is added' do
    freezer = Freezer.new(100)
    item = Item.new('FAKE SANDWICH', 10)
    freezer.add(item)
    expect(freezer.remaining_capacity).to eq(90)
  end

  it 'changes the temperature when its level is set' do
    freezer = Freezer.new
    freezer.set_level(7)
    expect(freezer.temperature).to eq(0)
  end

end
