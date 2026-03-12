require_relative '../lib/refrigerator'

describe 'A refrigerator' do

  it 'has a chiller, freezer, dispenser, and reservoir' do
    fridge = Refrigerator.new('FAKE CHILLER', 'FAKE FREEZER',
      'FAKE DISPENSER', 'FAKE RESERVOIR')
    expect(fridge.chiller).to eq('FAKE CHILLER')
    expect(fridge.freezer).to eq('FAKE FREEZER')
    expect(fridge.water_dispenser).to eq('FAKE DISPENSER')
    expect(fridge.water_reservoir).to eq('FAKE RESERVOIR')
  end

  it 'has the combined capacity of the chiller and the freezer' do
    chiller = Chiller.new(100)
    freezer = Freezer.new(100)
    fridge = Refrigerator.new(chiller, freezer, nil, nil)
    expect(fridge.total_capacity).to eq(200)
  end

  it 'reduces capacity when an item is chilled' do
    chiller = Chiller.new(100)
    freezer = Freezer.new(100)
    fridge = Refrigerator.new(chiller, freezer, nil, nil)
    item = Item.new('FAKE SANDWICH', 10)
    fridge.chill(item)
    expect(fridge.remaining_capacity).to eq(190)
  end

  it 'reduces capacity when an item is frozen' do
    chiller = Chiller.new(100)
    freezer = Freezer.new(100)
    fridge = Refrigerator.new(chiller, freezer, nil, nil)
    item = Item.new('FAKE SANDWICH', 10)
    fridge.freeze(item)
    expect(fridge.remaining_capacity).to eq(190)
  end

  it 'has a reduced capacity when items are added to the chiller and freezer' do
    chiller = Chiller.new(100)
    freezer = Freezer.new(100)
    fridge = Refrigerator.new(chiller, freezer, nil, nil)
    item = Item.new('FAKE SANDWICH', 10)
    fridge.freeze(item)
    fridge.chill(item)
    expect(fridge.remaining_capacity).to eq(180)
  end

  it 'turns on the chiller and freezer when plugged in' do
    chiller = Chiller.new
    freezer = Freezer.new
    fridge = Refrigerator.new(chiller, freezer, nil, nil)
    fridge.plug_in
    expect(fridge.chiller.get_power).to eq(:on)
    expect(fridge.freezer.get_power).to eq(:on)
  end

  it 'turns off the chiller and freezer when unplugged' do
    chiller = Chiller.new
    freezer = Freezer.new
    fridge = Refrigerator.new(chiller, freezer, nil, nil)
    fridge.plug_in
    fridge.unplug
    expect(fridge.chiller.get_power).to eq(:off)
    expect(fridge.freezer.get_power).to eq(:off)
  end

  it 'changes the chiller temperature when its level is set' do
    chiller = Chiller.new
    fridge = Refrigerator.new(chiller, nil, nil, nil)
    fridge.set_chiller_level(7)
    expect(fridge.chiller.temperature).to eq(35)
  end

  it 'changes the chiller temperature when its level is set' do
    freezer = Freezer.new
    fridge = Refrigerator.new(nil, freezer, nil, nil)
    fridge.set_freezer_level(7)
    expect(fridge.freezer.temperature).to eq(0)
  end

end
