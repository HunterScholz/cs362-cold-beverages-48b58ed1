class Vessel
  attr_reader :volume, :name

  def initialize(name, volume)
    @name = name
    @volume = volume
    @full = false
  end

  def fill()
    @full = true
  end

  def empty?()
    return !@full
  end

end
