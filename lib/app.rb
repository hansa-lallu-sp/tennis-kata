nick = Player.new('nick')
hansa = Player.new('hansa')

scoreboard = Scorecard.new(nick, hansa)

TennisGame.new(Scorecard)