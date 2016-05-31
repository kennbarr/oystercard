class Journey

  attr_reader :entry_station, :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def finish(exit_station)
    @exit_station = exit_station
    self
  end

  def fare
    return 0 if @entry_station.nil? && @exit_station.nil?
    in_journey? ? 6 : 1
  end

  def in_journey?
    !@entry_station.nil? && @exit_station.nil?
  end

end
