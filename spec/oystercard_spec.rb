require 'oystercard'

describe Oystercard do 

  it 'has a balance' do
    expect(subject.balance).to eq (0)
  end  

  describe '#top_up' do

    it 'allows us, to increase our balance' do 
      expect { subject.top_up(20) }.to change { subject.balance }.by 20 
    end

  end

end 
