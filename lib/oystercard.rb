
class Oystercard
  attr_reader :balance
  BALANCE_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Maximum Balance Exceeded: £#{BALANCE_LIMIT}" if over_limit?(amount)
    @balance += amount
  end

  private 

  def over_limit?(amount)
    amount + @balance - BALANCE_LIMIT > 0
  end 

end
