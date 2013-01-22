require 'debugger'
require 'rspec'
require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative "game"

describe "Deck" do
  subject(:deck) {Deck.new}

  let(:cards) {deck.deck}

  describe "#create_deck" do
    it "should have 52 cards" do
      cards.length.should == 52
    end

    it "should have 1 of each card" do
      cards.uniq.should == cards
    end
  end

  describe "#shuffle" do
    it "shuffles the deck" do
      cards.should_not == cards.shuffle
    end
  end

  describe "#take" do
    it "takes x number of cards from the top of the deck" do
      cards.take(3).length.should == 3
    end
  end

  ## it might be useful to test here if the cards are at the bottom of the deck. right now it only checks if they have
  # been returned at all
  describe "#remove" do
    it "removes x cards from play and puts them at the bottom of the deck" do
      deck.take(3)
      deck.remove(3)
      cards.length.should == 52
    end
  end

end

describe "Player" do
  subject(:player) {Player.new}
  let(:deck) {Deck.new}
  let(:game) {Game.new}

  describe "#stay" do
    it "takes no more cards into hand" do
      pending "don't have multiple players yet"
    end
  end

  describe "hit" do
    it "takes one more card into hand" do
      game.deal(player)
      player.hit(deck)
      player.hand.length.should == 3
    end
  end

  describe "#points" do
    it "adds up points in the player's hand" do
      player.hand << Card.new(:diamonds, :king)
      player.hand << Card.new(:clubs, :four)
      player.points.should == 14
    end
  end
end

describe "Game" do
  subject(:game) {Game.new}
  let(:player) {Player.new}

  describe "#deal" do
    it "deals 2 cards to a player" do
      game.deal(player)
      player.hand.length.should == 2
    end
  end

  describe "#bust?" do
    it "returns true when points are over 21" do
      player.hand << Card.new(:diamonds, :king)
      player.hand << Card.new(:clubs, :four)
      player.hand << Card.new(:clubs, :king)
      game.bust?(player).should be_true
    end

    it "returns false when points are under 21" do
      player.hand << Card.new(:diamonds, :king)
      player.hand << Card.new(:clubs, :four)
      game.bust?(player).should be_false
    end
  end
end
