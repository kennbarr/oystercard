class Station


  attr_reader :station_name

  def initialize(station_name)
    @station_name = station_name
  end

  def check_zone
    1
  end


end
