defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "the sum of two plus two is four" do
    assert 2 + 2 == 4
  end

  test "create_deck makes 20 cards" do
    deck_length = length(Cards.create_deck())
    assert deck_length == 52
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck()
    refute deck == Cards.shuffle(deck)
  end

  test "contains? returns true if the deck contains the card" do
    deck = Cards.create_deck()
    assert Cards.contains?(deck, "Ace of Spades")
  end

  test "deal returns a hand and the rest of the deck" do
    deck = Cards.create_deck()
    {hand, rest} = Cards.deal(deck, 1)
    assert length(hand) == 1
    assert length(rest) == 51
  end

  test "save and load the deck" do
    deck = Cards.create_deck()
    Cards.save(deck, "my_deck.bin")
    assert Cards.load("my_deck.bin") == deck
  end

  test "create_hand returns a hand and the rest of the deck" do
    {hand, rest} = Cards.create_hand(1)
    assert length(hand) == 1
    assert length(rest) == 51
  end
end
