require 'station'

describe Station do
  subject(:station) { described_class.new("Bank",1) }

  it 'station has a name' do
    expect(station.name).to eq "Bank"
  end

  it 'station has a zone' do
    expect(station.zone).to eq 1
  end
end
