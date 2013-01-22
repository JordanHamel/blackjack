class Game

  def initialize
    @deck = Deck.new
  end

  def play
  end

  def won?
  end

  def bust?(player)
    return true if player.points > 21
    false
  end

  def deal(player)
    2.times {player.hand << @deck.take}
  end

end