require './game.rb'
require './deck.rb'

class Player

  attr_reader :hand, :points

  def initialize
    @hand = []
    @points = points
  end

  def points
    total = 0
    aces = 0

    @hand.each do |card|
      if card.value == :ace
        aces += 1
      else
        total += card.blackjack_value(card.value)
      end
    end

    aces.times {(total + 11 <= 21) ? total += 11 : total += 1}
    total
  end

  def stay
  end

  def hit(deck)
    @hand << deck.take
  end

end