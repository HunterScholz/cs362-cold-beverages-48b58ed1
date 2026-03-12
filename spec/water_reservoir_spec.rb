require_relative '../lib/water_reservoir'

describe 'A water reservoir' do

  it 'has a capacity and initial volume' do
    reservoir = WaterReservoir.new(10, 10)
    expect(reservoir.current_water_volume).to eq(10)
    expect(reservoir.capacity).to eq(10)
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

  # TODO this currently supposed negatives, which is no good
  it 'loses the correct water volume when drained' do
    reservoir = WaterReservoir.new(10, 10)
    reservoir.drain(10)
    expect(reservoir.current_water_volume).to eq(0)
  end

end
