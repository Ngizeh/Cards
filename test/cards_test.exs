defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "deck of card has 28 cards" do
    deck_length = length(Cards.create_deck())
    assert deck_length == 28
  end

  test "shuffle returns a randomized deck" do
    deck = Cards.create_deck()
    assert deck != Cards.shuffle(deck)
  end
end
