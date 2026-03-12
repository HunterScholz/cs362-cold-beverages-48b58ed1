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

  def empty?()
    return !@full
  end

  def clear()
    @full = false
    @liquid = nil
  end

end
