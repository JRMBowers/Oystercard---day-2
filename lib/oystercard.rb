
class Oystercard
  attr_reader :balance, :station, :entry_station
  BALANCE_LIMIT = 90
  LOWER_LIMIT = 1

  def initialize()
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    fail "Maximum Balance Exceeded: £#{BALANCE_LIMIT}" if over_limit?(amount)
    @balance += amount
  end

  def in_journey?
    !!entry_station
  end 

  def touch_in(station)
    fail "insufficient balance" if @balance < LOWER_LIMIT
    @entry_station = station
  end 

  def touch_out
    deduct
    @entry_station = nil
  end 

  private 

  def over_limit?(amount)
    amount + @balance - BALANCE_LIMIT > 0
  end 

  def deduct
    @balance -= LOWER_LIMIT
  end

end
