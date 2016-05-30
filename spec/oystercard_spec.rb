require 'oystercard'

describe Oystercard do

  it "should start with a balance of zero." do
    expect(subject.balance).to eq 0
  end

  describe "#top_up" do
  	it "should increase the balance with a specified amount." do
  		expect{subject.top_up(10)}.to change{subject.balance}.by 10
  	end
  end

end