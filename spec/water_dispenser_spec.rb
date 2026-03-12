require_relative '../lib/water_dispenser'

describe 'A water dispenser' do

  it 'has a reservoir' do
    dispenser = WaterDispenser.new('FAKE RESERVOIR')
    expect(dispenser.reservoir).to eq('FAKE RESERVOIR')
  end

  it 'loses volume in its reservoir when dispensed' do
    reservoir = WaterReservoir.new(100)
    reservoir.fill()
    vessel = Vessel.new('FAKE VESSEL', 100)
    dispenser = WaterDispenser.new(reservoir)
    dispenser.dispense(vessel)
    expect(reservoir.current_water_volume).to eq(0)
  end

  it 'fills a vessel when it dispenses' do
    reservoir = WaterReservoir.new(100, 100)
    vessel = Vessel.new('FAKE VESSEL', 100)
    dispenser = WaterDispenser.new(reservoir)
    dispenser.dispense(vessel)
    expect(vessel.empty?).to eq(false)
  end

end
