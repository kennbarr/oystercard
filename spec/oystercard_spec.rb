require 'oystercard'

describe Oystercard do
  it 'has a balance of 0' do
    expect(subject.balance).to eq 0
  end

  it 'can top up the balance' do
    expect(subject.top_up(10)).to eq 10
  end

  it 'cannot top up past limit' do
    subject.top_up(90)
    message = "Cannot top up past £90 limit"
    expect { subject.top_up(10) }.to raise_error message
  end

  it 'can deduct money' do
    subject.top_up(20)
    subject.deduct(10)
    expect(subject.balance).to eq 10
  end
end
