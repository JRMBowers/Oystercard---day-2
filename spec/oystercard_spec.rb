require 'oystercard'

describe Oystercard do 

  it 'has a balance' do
    expect(subject.balance).to eq (0)
  end  

  describe '#top_up' do

    it 'allows us, to increase our balance' do 
      expect { subject.top_up(20) }.to change { subject.balance }.by 20 
    end

    it 'throws error if balance exceeds maximum limit of £90' do
      balance_limit = Oystercard::BALANCE_LIMIT
      error_message = "Maximum Balance Exceeded: £#{balance_limit}"
      expect { subject.top_up(balance_limit+1) }.to raise_error error_message
    end 

  end

end 
