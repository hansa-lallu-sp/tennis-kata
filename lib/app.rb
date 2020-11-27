require_relative 'player'
require_relative 'tennis_game'

nick = Player.new('Nick')
hansa = Player.new('Hansa')

TennisGame.new(nick, hansa)