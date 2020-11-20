class TennisGame

    attr_accessor :scorecard, :round

   def initialize(scorecard)
    @scorecard = scorecard
    @round = 0

    play
   end

   def play
    print_message
    play_round(round) unless scorecard.player_1.win? || scorecard.player_2.win?
   end

   def print_message(who_wins)
    puts 'game start' if round == 0 

    puts "#{who_wins} won this set!\n #{display_scoreboard}"

   end

   def display_scoreboard
    puts "#{scorecard.player_1.name}: #{scorecard.player_1.points}"
    puts "#{scorecard.player_2.name}: #{scorecard.player_2.points}"

    if (scorecard.player_1.points == 40 && scorecard.player_2.points == 40) do
        puts 'Deuce!'
    end
   end

   def play_round(round)
    who_wins = rand(0..1).round

    scorecard.player_1.gain(15) if who_wins == 0 && (scorecard.player_1.points == 0 || scorecard.player_1.points == 15)
    scorecard.player_2.gain(15) if who_wins == 1 && (scorecard.player_2.points == 0 || scorecard.player_2.points == 15)

    scorecard.player_1.gain(10) if who_wins == 0 && (scorecard.player_1.points == 30)
    scorecard.player_2.gain(10) if who_wins == 1 && (scorecard.player_2.points == 30)

    if who_wins == 0 && (scorecard.player_1.points == 40 && scorecard.player_1.advantage == false) do
        scorecard.player_1.advantage = true
        scorecard.player_2.advantage = false 
      end
    end

    if who_wins == 1 && (scorecard.player_2.points == 40 && scorecard.player_2.advantage == false) do
        scorecard.player_2.advantage = true
        scorecard.player_1.advantage = false 
      end
    end

    scorecard.player_1.win = true if who_wins == 0 && (scorecard.player_1.points = 40 && scorecard.player_1.advantage == true)
    scorecard.player_2.win = true if who_wins == 1 && (scorecard.player_2.points = 40 && scorecard.player_2.advantage == true)

    is_there_a_winner?

    print_message(who_wins)
   end

   def is_there_a_winner?

   end

#    def how_many_points(round)
#     points = 15 if round == 0
#     points = 1
#    end

end 