require 'journey'

class Oystercard

attr_reader :balance, :journeys

LIMIT = 90
MIN_BALANCE = 1

  def initialize(journey = Journey.new)
    @balance = 0
    @journeys = []
    @journey = journey
  end

  def top_up(amount)
    fail "Cannot top up past £#{LIMIT} limit" if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient balance" if @balance < MIN_BALANCE
    @journey.start(station)
    @journeys << @journey
  end

  def touch_out(station)
    @journey.finish(station)
    deduct

    @journey = Journey.new
  end

  def in_journey?
    @journey.in_journey?
  end

  private
    def deduct(fare = MIN_BALANCE)
      @balance -= fare
    end

end
