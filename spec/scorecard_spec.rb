require 'scorecard'

describe Scorecard do 
    
    let(:player_1) { Player.new('Loga') }
    let(:player_2) { Player.new('Ed') }
    let(:scorecard) { Scorecard.new(player_1, player_2) }

    it 'has a scorecard' do 
        expect(Scorecard.new(player_1, player_2)).to be_instance_of(Scorecard)
    end

    it 'initializes with 2 players' do
        expect(scorecard.player_1).to eq(player_1)
        expect(scorecard.player_2).to eq(player_2)
    end

    it 'has a score of zero when started' do 
        expect(scorecard.player_1.points).to eq(0)
        expect(scorecard.player_2.points).to eq(0)
    end 
end 
