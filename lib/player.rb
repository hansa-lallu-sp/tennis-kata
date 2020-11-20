class Player

    attr_accessor :points, :name, :win, :advantage

    def initialize(name)
        @name = name
        @points = 0
        @win = false
        @advantage = false
    end

    def gain(points)
        @points += points.to_i
    end

    def win?
        player.win
    end

    def advantage?
        player.advantage
    end
end
