require_relative '../lib/water_reservoir'

describe 'A water reservoir' do

  it 'has a capacity, initial volume, and liquid' do
    reservoir = WaterReservoir.new(10, 10, 'FAKE LIQUID')
    expect(reservoir.current_water_volume).to eq(10)
    expect(reservoir.capacity).to eq(10)
    expect(reservoir.liquid).to eq('FAKE LIQUID')
  end

  it 'is empty if the volume is 0' do
    reservoir = WaterReservoir.new(10, 0)
    expect(reservoir.current_water_volume).to eq(0)
    expect(reservoir).to be_empty
  end

  it 'has a volume equal to its capacity if it is filled' do
    reservoir = WaterReservoir.new(10, 0)
    reservoir.fill
    expect(reservoir.current_water_volume).to eq(reservoir.capacity)
  end

  it 'loses the correct water volume when drained' do
    reservoir = WaterReservoir.new(10, 10)
    reservoir.drain(10)
    expect(reservoir.current_water_volume).to eq(0)
  end

end
