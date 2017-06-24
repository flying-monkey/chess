require 'singleton'

class NullPiece #< Piece
  include Singleton
  def initialize
    @nullpiece
  end
end
