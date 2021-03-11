

class Tile

    def initialize(is_bomb, board)
        @is_bomb = is_bomb
        @is_revealed = false
        @adjacent_bombs
        @board = board

    end

    def inspect
        p "Tile is_bomb = #{is_bomb}, is_revealed = #{is_revealed}"
    end

    def adjacent_bombs

    end



end