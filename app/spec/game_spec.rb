require_relative '../models/game/game'

describe '#Game' do
let(:game) { Game.new('Yes', '2017-01-01', '2012-01-01') }

    it 'can_be_archived? should return false if last_played_at is < 2 years' do
        expect(game.can_be_archived?).to eq(true)
    end

    it 'last_played_at year should be 2017' do
        expect(Date.parse(game.last_played_at).year).to eq (2017)
    end

end