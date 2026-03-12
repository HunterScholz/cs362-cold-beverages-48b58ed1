class Vessel
  attr_reader :volume, :name, :liquid

  def initialize(name, volume)
    @name = name
    @volume = volume
    @full = false
    @liquid = nil
  end

  def fill(liquid)
    @full = true
    @liquid = liquid
  end

  def empty?
    !@full
  end

  def drain
    @full = false
    @liquid = nil
  end

end
