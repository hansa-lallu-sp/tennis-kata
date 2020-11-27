require 'tennis_game'
require 'player'
require 'pry-byebug'

describe TennisGame do 

    let(:player_1) { Player.new('Santa') }
    let(:player_2) { Player.new('Elf') }
    let(:tennis_game) { TennisGame.new(player_1, player_2) }
    let(:round) { tennis_game.round }

    it 'has a scorecard' do 
        expect(tennis_game).to be_instance_of(TennisGame)
    end 

    it 'increments round from 1' do
        expect(round).to be_instance_of(Integer)
    end
    
    describe "#play" do 

        it 'has a method named play' do 
            expect(tennis_game).to respond_to :play
        end 

    end 

    describe "#print_message" do 

        it 'prints a start message at round 1' do
            expect{ tennis_game.play }.to output(/Game Start/).to_stdout
        end

    end 

    describe '#winner' do

        it 'will have a winner' do
            tennis_game.play
            expect{ tennis_game.play }.to change{ tennis_game.winner? }.from(false).to(true)
        end

    end

end 