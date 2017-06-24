require_relative 'piece.rb'
require_relative 'nullpiece.rb'



class Board

  attr_reader :grid

  BACK_ROW = [
    Rook,
    Knight,
    Bishop,
    Queen,
    King,
    Bishop,
    Knight,
    Rook
  ]

  def initialize
    @grid = Array.new(8)  {Array.new(8) { NullPiece.instance }}
    populate
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def populate
    @grid[0].each_with_index do |piece, i|
      self[[0,i]] = create_piece(BACK_ROW[i], 0, i, :b)
    end
    @grid[1].each_with_index do |piece, i|
      self[[1,i]] = create_piece(Pawn, 1, i, :b)
    end
    @grid[7].each_with_index do |piece, i|
      self[[7,i]] = create_piece(BACK_ROW[i], 7, i, :w)
    end
    @grid[6].each_with_index do |piece, i|
      self[[6,i]] = create_piece(Pawn, 6, i, :w)
    end
  end

  def create_piece(cl, x, i, color)
    cl.new([x, i], color, self)
  end

  def move_piece(start_pos, end_pos)
    raise Exception if start_pos.is_a?(NullPiece)
    raise Exception unless @grid[start_pos].valid_move?
  end

end
