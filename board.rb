require_relative './tile.rb'

class Board
    
    def self.empty_grid
        Array.new(9) do
          Array.new(9) { nil }
        end
    end

    def initialize(grid = Board.empty_grid)
        
        @grid = grid
        populate

    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    # def []=(pos, value)
    #     row, col = pos
    #     @grid[row][col] = value
    # end

    def populate
        num_bombs = (8..12).to_a.sample
        num_bombs.times do
            row = (0..8).to_a.sample
            col = (0..8).to_a.sample
            @grid[row][col] = Tile.new(true,self)
        end
        9.times do |idx1|
            9.times do |idx2|
                if @grid[idx1][idx2] == nil
                    @grid[idx1][idx2] = Tile.new(false, self)
                end
            end
        end
    end

    def render
        @grid.each do |row|
            print "\n"
            row.each do |tile|
                if tile.is_revealed #once time is built out

                else
                    print '_ ' 
                end
            end
        end
    end


end