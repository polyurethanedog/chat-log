require 'rails_helper'

RSpec.describe LogParserService do
  let(:sample_log) do
    <<~LOG
      L 07/30/2021 - 22:09:09: "scuse me miss!<515><[U:1:97746797]><unknown>" spawned as "undefined"
      L 07/30/2021 - 22:09:09: "scuse me miss!<515><[U:1:97746797]><>" entered the game
      L 07/25/2021 - 14:35:58: "hexerii<361><[U:1:189701717]><Blue>" say "i was standing still at one point bruh come on"
      L 07/25/2021 - 15:34:44: "hexerii<361><[U:1:189701717]><Red>" say_team "play the game instead of complaining 24/7"
    LOG
  end

  it 'parses a message log' do
    parsed_messages = subject.parse(sample_log)
    expect(parsed_messages.first.message).to eq('i was standing still at one point bruh come on')
    expect(parsed_messages.first.player_name).to eq('hexerii')
    expect(parsed_messages.first.player_steamid3).to eq('[U:1:189701717]')
    expect(parsed_messages.first.player_team).to eq('BLU')
    expect(parsed_messages.first.sent_at).to eq(DateTime.new(2021, 7, 25, 14, 35, 58))
    expect(parsed_messages.first.team).to eq(false)
    expect(parsed_messages.second.team).to eq(true)
  end
end
