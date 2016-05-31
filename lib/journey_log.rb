class JourneyLog
  attr_reader :journeys, :journey

  def initialize(journey = Journey.new)
    @journeys = []
    @journey = journey
  end

  def start(station)
    @journeys << @journey.finish(nil) if in_journey?
    @journey = Journey.new(station)
  end

  def finish(station)
    if in_journey?
      @journeys << @journey.finish(station)
    else
      @journey = Journey.new(nil)
      @journeys << @journey.finish(station)
    end
  end

  def in_journey?
    @journey.in_journey?
  end
end
