defmodule Cards do
 @moduledoc """
   Provides a method for creating and handling deck of cards
 """

 @doc """
  Returns a list of strings representing a deck of playing card
 """
 def create_deck do
  values = ["Ace", "Two", "Three","Four", "Five", "King", "Queens"]
  suites = ["Spades","Diamonds","Cloves", "Hearts"]
  for value <- values, suit <- suites do
   "#{value} of #{suit}"
  end
 end

 @doc """
    Receives the passed `deck` and returns a new shuffled `deck` of cards
 """
 def shuffle(deck) do
  Enum.shuffle(deck)
 end

 @doc """
   Checks to the see if the passed `deck` contains the specified `card`.

 ## Example
     iex> deck = Cards.create_deck
     iex> Cards.contains?(deck, "Queens of Cloves")
     true

 """
 def contains?(deck, card) do
  Enum.member?(deck, card)
 end

 @doc """
    Divides the deck into `hand`  and the remainder of the deck.
    The `hand_size` determines the number of cards that should be in the hand.

 ## Example
     iex> deck = Cards.create_deck
     iex> { hand, _deck } = Cards.deal(deck, 1)
     iex> hand
     ["Ace of Spades"]

 """
 def deal(deck, hand_size) do
  Enum.split(deck, hand_size)
 end

 @doc """
    Get the passed `deck` and save it on  `filename`  in binary data
 """
 def save(deck, filename) do
  File.write(filename, :erlang.term_to_binary(deck))
 end

 @doc """
    Loads the save deck of card the passed `filename`.
    If filename name does not exist, it gives the reason
 """
 def load(filename) do
  case File.read(filename) do
   {:ok, binary} -> :erlang.binary_to_term(binary)
   {:error, _reason }-> "This file does not exits"
  end
 end

 @doc """
    Gets the deck of cards, shuffles it, deal the `hand_size` and returns the `hand`
 """
 def create_hand(hand_size) do
  {hand , _rest } = Cards.create_deck()|>shuffle|>deal(hand_size)
  hand
 end

 def hello do
  "world"
 end
end
