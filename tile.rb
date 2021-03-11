

class Tile

    attr_reader :is_revealed, :is_bomb

    def initialize(is_bomb, board, position)
        @is_bomb = is_bomb
        @is_revealed = false
        @adjacent_bombs
        @board = board
        @position = position

    end

    def reveal 
        @is_revealed = true
        if @is_bomb
            puts "GAME OVER"
            #SOMETHING ELSE TO END THE GAME
        else
            @adjacent_bombs = adjacent_bombs
            if @adjacent_bombs == 0
                row_min = @position[0]-1
                row_max = @position[0]+1
                col_min = @position[1]-1
                col_max = @position[1]+1

                row_min = 0 if row_min < 0
                col_min = 0 if col_min < 0
                row_max = 8 if row_max > 8
                col_max = 8 if col_max > 8

                row_range = (row_min..row_max)
                col_range = (col_min..col_max)
                row_range.each do |row|
                    col_range.each do |col|
                        if !@board[[row,col]].is_revealed
                            @board[[row,col]].reveal
                        end
                    end
                end
            end
        end
        
    end

    def cheat_reveal
        @is_revealed = true
        @adjacent_bombs = adjacent_bombs
    end

    def inspect
        p "Tile is_bomb = #{is_bomb}, is_revealed = #{is_revealed}, adjacent_bombs = #{adjacent_bombs}"
    end

    def adjacent_bombs
        adjacent_bombs = 0

        row_min = @position[0]-1
        row_max = @position[0]+1
        col_min = @position[1]-1
        col_max = @position[1]+1

        row_min = 0 if row_min < 0
        col_min = 0 if col_min < 0
        row_max = 8 if row_max > 8
        col_max = 8 if col_max > 8

        row_range = (row_min..row_max)
        col_range = (col_min..col_max)

        row_range.each do |row|
            col_range.each do |col|
                adjacent_bombs += 1 if @board[[row,col]].is_bomb
            end
        end
        return adjacent_bombs
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