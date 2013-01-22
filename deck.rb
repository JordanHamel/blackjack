require './card.rb'
#require 'debugger'
class Deck

  attr_accessor :deck

  def initialize
    @deck = create_deck
  end

  def create_deck
    deck = []
    Card.suits.product(Card.values).each do |suit, value|
      deck << Card.new(suit, value)
    end
  end

  def shuffle
    @deck.shuffle!
  end

  def take(n = 1)
    n.times do
      @deck.pop
    end
  end

  def remove(n)
    n.times do
      @deck.unshift(n)
    end
  end

end