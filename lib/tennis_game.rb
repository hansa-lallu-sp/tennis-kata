require 'pry-byebug'

class TennisGame

    attr_accessor :round, :player_1, :player_2

   def initialize(player1, player2)
    @player_1 = player1
    @player_2 = player2
    @round = 1

    play
   end

   def play
    print_start_message
    play_round(round) while !winner?
    print_end_message if winner?
   end

   def print_start_message
    puts "Game Start"
   end

   def print_end_message
    player = player_1.name if player_1.win
    player = player_2.name if player_2.win
    puts "THE WINNER IS #{player.upcase}"
   end

   def print_message(who_wins, round)
    player = player_1.name if who_wins == 0
    player = player_2.name if who_wins == 1
    puts "#{display_scoreboard}#{round}:#{player} won this set!\n\n"
   end

   def display_scoreboard
    puts "#{player_1.name}: #{player_1.points}"
    puts "#{player_2.name}: #{player_2.points}"

    if (player_1.points == 40 && player_2.points == 40)
      player = player_1.name if player_1.advantage
      player = player_2.name if player_2.advantage
      puts "Deuce!, adv : #{player}"
    end
   end

   def play_round(round)
    who_wins = rand(0..1).round

    player_1.win = true if player_1.points == 40 && player_1.points > player_2.points && who_wins == 0
    player_2.win = true if player_2.points == 40 && player_2.points > player_1.points && who_wins == 1

    deuce(who_wins) if player_1.points == 40 && player_2.points == 40

    player_1.gain(10) if who_wins == 0 && player_1.points == 30
    player_2.gain(10) if who_wins == 1 && player_2.points == 30

    player_1.gain(15) if who_wins == 0 && (player_1.points == 0 || player_1.points == 15)
    player_2.gain(15) if who_wins == 1 && (player_2.points == 0 || player_2.points == 15)
    
    print_message(who_wins, round)

    @round = round + 1
   end

   def deuce(who_wins)
    player_1.win = true if who_wins == 0 && (player_1.points == 40 && player_1.advantage == true)
    player_2.win = true if who_wins == 1 && (player_2.points == 40 && player_2.advantage == true)

    if who_wins == 0 && (player_1.points == 40 && player_1.advantage == false)
      player_1.advantage = true
      player_2.advantage = false 
    end

    if who_wins == 1 && (player_2.points == 40 && player_2.advantage == false)
      player_2.advantage = true
      player_1.advantage = false 
    end
   end

   def winner?
    player_1.win || player_2.win
   end

end 