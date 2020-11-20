require 'tennis_game'

describe TennisGame do 

    let(:player_1) { Player.new('Santa') }
    let(:player_2) { Player.new('Alf') }
    let(:scorecard) { Scorecard.new(player_1, player_2) }
    let(:tennis_game) { TennisGame.new(scorecard) }
    let(:round) { tennis_game.round }

    it 'has a scorecard' do 
        expect(tennis_game).to be_instance_of(TennisGame)
    end 

    it 'initializes at round 0' do
        expect(tennis_game.round).to eq(0)
    end
    
    describe "#play" do 

        it 'has a method named play' do 
            expect(tennis_game).to respond_to :play
        end 

    end 

    describe "#print_message" do 

        it 'prints a start message at round 1' do
            expect{ tennis_game.play }.to output(/game start/).to_stdout
        end

    end 

end 