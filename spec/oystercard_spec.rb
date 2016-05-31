require 'oystercard'

describe Oystercard do
  let(:station) { double(:station) }
  let(:station2) { double(:station2) }
  let(:log) {double(:log, start: nil, finish: nil, in_journey?: false)}
  subject(:card) { described_class.new(log) }

  it { is_expected.to respond_to(:touch_in).with(1).argument }
  it { is_expected.to respond_to(:touch_out).with(1).argument }

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

  it 'raises error when below min balance' do
    expect { card.touch_in(station) }.to raise_error "Insufficient balance"
  end

end
