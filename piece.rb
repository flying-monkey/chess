require 'byebug'

class Piece
  attr_reader :color

  def initialize(position, color = :b, board)
    @position = position
    @color = color
    @board = board
  end

  def to_s
    if self.color == :b
      return @symbol.first
    else
      return @symbol.last
    end
  end

end

class Rook < Piece
  attr_reader :color

  def initialize(position, color = :b, board)
    @symbol = ['♜', '♖']
    super
  end

end

class Knight < Piece
  def initialize(position, color = :b, board)
    @symbol = ["♞", "♘"]
    super
  end

end

class Bishop < Piece
  def initialize(position, color = :b, board)
    @symbol = ["♝", "♗"]
    super
  end

end

class King < Piece
  def initialize(position, color = :b, board)
    @symbol = ["♚", "♔"]
    super
  end

end

class Queen < Piece
  def initialize(position, color = :b, board)
    @symbol = ["♛", "♕"]
    super
  end

end

class Pawn < Piece
  def initialize(position, color = :b, board)
    @symbol = ["♟", "♙"]
    super
  end

end
