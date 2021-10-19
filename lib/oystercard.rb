
class Oystercard
  attr_reader :balance, :in_journey
  BALANCE_LIMIT = 90
  LOWER_LIMIT = 1

  def initialize
    @balance = 0
    @in_journey = false 
  end

  def top_up(amount)
    fail "Maximum Balance Exceeded: £#{BALANCE_LIMIT}" if over_limit?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end 

  def touch_in
    fail "insufficient balance" if @balance < LOWER_LIMIT
    @in_journey = true 
  end 

  def touch_out
    @in_journey = false 
  end 

  private 

  def over_limit?(amount)
    amount + @balance - BALANCE_LIMIT > 0
  end 

end
