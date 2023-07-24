class AssemblyLine
  RAW_RATE = 221

  def initialize(speed)
    raise 'Speed must be integer' unless speed.is_a? Integer
    raise 'Speed must be positive' unless speed.positive?
    raise 'Speed must be <= 10' unless speed <= 10

    @speed = speed
  end

  def success_rate
    return 1.00 if @speed >= 1 && @speed <= 4
    return 0.90 if @speed >= 5 && @speed <= 8
    return 0.80 if @speed == 9
    return 0.77 if @speed == 10

    0.00
  end

  # expects float result
  def production_rate_per_hour
    @speed * RAW_RATE * success_rate
  end

  # expects integer result
  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end
end
