require 'oystercard'

describe Oystercard do
  let(:station) { double(:station) }
  let(:station2) { double(:station2) }
  let(:journey) {double(:journey, start: nil, finish: nil, in_journey?: false)}
  subject(:card) { described_class.new(journey) }

  it 'has a balance of 0' do
    expect(card.balance).to eq 0
  end

  it 'can top up the balance' do
    expect(card.top_up(10)).to eq 10
  end

  it 'cannot top up past limit' do
    card.top_up(90)
    message = "Cannot top up past £90 limit"
    expect { card.top_up(10) }.to raise_error message
  end

  it 'can touch in and add journey to history' do
    card.top_up(5)
    card.touch_in(station)
    expect(card.journeys).to include journey
  end

  it 'can touch out' do
    card.top_up(5)
    card.touch_in(station)
    card.touch_out(station2)
    expect(card.in_journey?).to eq false
  end

  it 'is not in journey when initialised' do
    expect(card.in_journey?).to eq false
  end

  it 'raises error when below min balance' do
    expect { card.touch_in(station) }.to raise_error "Insufficient balance"
  end

  it 'deducts the minimum fare on touch out' do
    card.top_up(5)
    card.touch_in(station)
    expect { card.touch_out(station) }.to change { card.balance }.by(-1)
  end

  it 'has an empty journey history on creation' do
    expect(card.journeys.empty?).to eq true
  end

end
