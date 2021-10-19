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

  describe '#deduct' do 
    
      it 'can deduct a fare from the balance' do 
        subject.top_up(20)
        expect { subject.deduct(15) }.to change { subject.balance }.by -15
      end

  end

  describe '#in_journey' do 
    context "touch_in" do 
      it 'confirms a new card is not in journey' do
        subject.top_up(5)
        expect(subject).not_to be_in_journey
      end
  
      it 'confirms when a card is in journey' do
        subject.top_up(5)
        subject.touch_in
        expect(subject).to be_in_journey
      end 
      it 'returns error when fare is deducted and balance is zero' do 
        error_message = 'insufficient balance'
        expect { subject.touch_in }.to raise_error error_message
      end 
    end 
    context "touch_out" do 
      it 'confirms when a card is touched out' do 
        subject.top_up(5)
        subject.touch_in
        subject.touch_out
        expect(subject).not_to be_in_journey 
      end 
      it "reduce balance by minimum fare" do 
        subject.top_up(5)
        expect{subject.touch_out}.to change{subject.balance}.by(-1)
      end
    end

  end 

end 
