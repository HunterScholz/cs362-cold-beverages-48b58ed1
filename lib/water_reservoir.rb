class WaterReservoir

  attr_reader :capacity
  attr_accessor :current_water_volume, :liquid

  def initialize(capacity = 10, initial_water_volume = 0, liquid = 'Water')
    @capacity = capacity
    @current_water_volume = initial_water_volume
    @liquid = liquid
  end

  def empty?
    @current_water_volume == 0
  end

  def fill
    @current_water_volume = capacity
  end

  def drain(volume)
    if self.empty? or volume > current_water_volume
      @current_water_volume == 0
    else
      @current_water_volume -= volume
    end
  end

end
