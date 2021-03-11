require_relative "board.rb"



class MinesweeperGame

    def initialize
        @board = Board.new
    end
    
    def get_pos
        pos = nil
        until pos && valid_pos?(pos)
            puts "Please enter a position on the board (3,4)"
            print '> '
            pos = parse_pos(gets.chomp)
        end
    end

    def parse_pos(string)
        string.split(',').map {|char| Integer(char) } 
    end

    def valid_pos?(pos)
        pos.is_a?(Array) && pos.length == 2 && pos.all? {|x| x.between?(0,8)}
    end

    def play_turn
        @board.render
        pos = get_pos
        @board[pos].reveal
    end

    def run 
        play_turn until false
    end

end