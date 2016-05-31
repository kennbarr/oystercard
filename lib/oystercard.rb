class Oystercard

attr_reader :balance

LIMIT = 90


  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Cannot top up past £#{LIMIT} limit" if @balance + amount > LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

end
