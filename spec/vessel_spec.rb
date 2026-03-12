require_relative '../lib/vessel'

describe 'A vessel for holding liquid' do

  it 'has a name and volume' do
    vessel = Vessel.new('FAKE', 100)
    expect(vessel.name).to eq('FAKE')
    expect(vessel.volume).to eq(100)
  end

  it 'is initially empty with no liquid' do
    vessel = Vessel.new('FAKE', 100)
    expect(vessel).to be_empty
    expect(vessel.liquid).to eq(nil)
  end

  it 'is no longer empty when we fill it' do
    vessel = Vessel.new('FAKE', 100)
    vessel.fill('FAKE LIQUID')
    expect(vessel).to_not be_empty
  end

  it 'has a liquid when filled' do
    vessel = Vessel.new('FAKE', 100)
    vessel.fill('FAKE LIQUID')
    expect(vessel.liquid).to eq('FAKE LIQUID')
  end

  it 'becomes empty and has no liquid when cleared' do
    vessel = Vessel.new('FAKE', 100)
    vessel.fill('FAKE LIQUID')
    vessel.clear()
    expect(vessel).to be_empty
    expect(vessel.liquid).to eq(nil)
  end

end
