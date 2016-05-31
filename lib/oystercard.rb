class Oystercard

attr_reader :balance, :journeys

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
    @journeys << {:entry => station}
  end

  def touch_out(station)
    @journeys.last[:exit] = station
    deduct
  end

  def in_journey?
    @journeys.empty? ? false : !@journeys.last.has_key?(:exit)
  end

  private
    def deduct(fare = MIN_BALANCE)
      @balance -= fare
    end

end
