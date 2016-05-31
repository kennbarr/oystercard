require 'journey_log'

describe JourneyLog do

  let(:station1) { double(:station1) }
  let(:station2) { double(:station2) }
  let(:journey) { double(:journey, start: nil, finish: nil, entry_station: nil) }

  subject(:log) { described_class.new(journey) }

  it 'starts a journey' do
    log.start(station1)
    expect(log.journeys).to include journey
  end

  it 'finishes journey' do
    log.start(station1)
    log.finish(station2)
    expect(log.journey).to_not eq journey
  end

end
