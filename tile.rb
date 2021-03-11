

class Tile

    attr_reader :is_revealed, :is_bomb

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

    def print_value
        if is_revealed
            if is_bomb
                return 'B '
            else
                return "#{@adjacent_bombs} "
            end
        else
            return '_ '
        end
    end



end