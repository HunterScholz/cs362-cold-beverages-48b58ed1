require_relative '../lib/chiller'

describe 'A chiller' do

  it 'has a capacity and temperature' do
    chiller = Chiller.new(100)
    expect(chiller.capacity).to eq(100)
    expect(chiller.temperature).to_not eq(nil)
  end

  it 'it initially powered off' do
    chiller = Chiller.new
    expect(chiller.get_power).to eq(:off)
  end

  it 'has its power on when turned on' do
    chiller = Chiller.new
    chiller.turn_on
    expect(chiller.get_power).to eq(:on)
  end

  it 'has its power off when turned off' do
    chiller = Chiller.new
    chiller.turn_on
    chiller.turn_off
    expect(chiller.get_power).to eq(:off)
  end

  it 'has a reduced capacity when an item is added' do
    chiller = Chiller.new(100)
    item = Item.new('FAKE SANDWICH', 10)
    chiller.add(item)
    expect(chiller.remaining_capacity).to eq(90)
  end

  it 'changes the temperature when its level is set' do
    chiller = Chiller.new
    chiller.set_level(7)
    expect(chiller.temperature).to eq(35)
  end

end
