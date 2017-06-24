require 'colorize'
require_relative 'board.rb'
require_relative 'cursor.rb'

class Display
  def initialize(board)
    @board = board
    @cursor_pos = Cursor.new([0,0], board)
  end

  def render
    disp = ''
    @board.grid.each_with_index do |row, j|
      row.each_with_index do |piece, i|
        if j.even? && i.even?
          if piece.is_a?(NullPiece)
            disp << "  ".colorize(:background => :white)
            disp << "\n" if i == 7
          else
            disp << piece.to_s.colorize(:background => :white)
            disp << " " unless i == 7
            disp << "\n" if i == 7
          end
        else
          if piece.is_a?(NullPiece)
            disp << "  ".colorize(:background => :grey)
            disp << "\n" if i == 7
          else
            disp << piece.to_s.colorize(:background => :grey)
            disp << " " unless i == 7
            disp << "\n" if i == 7
          end
        end
      end

    end
    puts disp
  end

end
