class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir)
    @reservoir = reservoir
  end

  def dispense(vessel)
    reservoir.drain(vessel.volume)
    vessel.fill(reservoir.liquid)
  end

end
