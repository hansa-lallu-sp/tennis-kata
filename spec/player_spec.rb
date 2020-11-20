require 'player'

describe Player do 

    let(:player) { Player.new('Grzegorz') }

    it 'has a player' do
        expect(player).to be_instance_of(Player)
    end

    it 'creates a player with 0 points' do
        expect(player.points).to eq(0)
    end

    it 'creates a player with a name' do
        expect(player.name).to eq('Grzegorz')
    end

    describe '#gain' do
        it 'increments by a number of points' do
            expect{ player.gain('15') }.to change{ player.points }.from(0).to(15)
        end
    end
end 
