require_relative "journey"

class JourneyLog

  attr_reader :journeys, :current_journey

  def initialize(start = Journey.new)
    @journeys = []
    @current_journey = start
  end

  def start(station)
    if @current_journey.in_journey?
      finish(:Incomplete)
    end
    @current_journey.start(station)
  end

  def finish(station)
    if @current_journey.in_journey?
      @current_journey.finish(station)
    else
      @current_journey.start(:Incomplete)
      @current_journey.finish(station)
    end
    new_journey
  end

  private

  def new_journey
    @journeys << @current_journey
    @current_journey = Journey.new
  end

end
