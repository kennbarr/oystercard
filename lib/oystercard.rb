class Oystercard

attr_reader :balance, :entry_station, :journeys

LIMIT = 90
MIN_BALANCE = 1


  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    fail "Cannot top up past £#{LIMIT} limit" if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail "Insufficient balance" if @balance < MIN_BALANCE
    @entry_station = station
  end

  def touch_out(station)
    @exit_station = station
    @journeys << {:entry => @entry_station, :exit => @exit_station}
    deduct
    @entry_station = nil
  end

  def in_journey?
    !!@entry_station
  end

  private
    def deduct(fare = MIN_BALANCE)
      @balance -= fare
    end

end
