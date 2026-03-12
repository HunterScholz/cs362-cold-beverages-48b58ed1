require_relative '../lib/water_dispenser'

describe 'A water dispenser' do

  it 'has a reservoir' do
    dispenser = WaterDispenser.new('FAKE RESERVOIR')
    expect(dispenser.reservoir).to eq('FAKE RESERVOIR')
  end

  # it 'loses volume in its reservoir when dispensed' do
  #   reservoir = WaterReservoir.new
  #   reservoir.fill()
  #   vessel = Vessel.new('FAKE', 100)
  #   dispenser = WaterDispenser.new(reservoir)
  #   expect(dispenser.dispense(vessel)).to eq(reservoir)
  # end

end
