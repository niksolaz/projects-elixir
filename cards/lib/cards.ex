defmodule Cards do
  @moduledoc """
    Provides functions for creating and handling a deck of cards.
  """

  @doc """
    Creates a deck of cards.

  ## Examples
    ```
    iex> deck = Cards.create_deck()
    iex> deck
    ["Ace of Spades", "King of Spades", "Queen of Spades", "Jack of Spades", "10 of Spades", "9 of Spades", "8 of Spades", "7 of Spades", "6 of Spades", "5 of Spades", "4 of Spades", "3 of Spades", "2 of Spades", "Ace of Hearts", "King of Hearts", "Queen of Hearts", "Jack of Hearts", "10 of Hearts", "9 of Hearts", "8 of Hearts", "7 of Hearts", "6 of Hearts", "5 of Hearts", "4 of Hearts", "3 of Hearts", "2 of Hearts", "Ace of Clubs", "King of Clubs", "Queen of Clubs", "Jack of Clubs", "10 of Clubs", "9 of Clubs", "8 of Clubs", "7 of Clubs", "6 of Clubs", "5 of Clubs", "4 of Clubs", "3 of Clubs", "2 of Clubs", "Ace of Diamonds", "King of Diamonds", "Queen of Diamonds", "Jack of Diamonds", "10 of Diamonds", "9 of Diamonds", "8 of Diamonds", "7 of Diamonds", "6 of Diamonds", "5 of Diamonds", "4 of Diamonds", "3 of Diamonds", "2 of Diamonds"]
    ```
  """
  @spec create_deck :: list(String.t())
  def create_deck do
    values = ["Ace", "King", "Queen", "Jack", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
    suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Shuffles a deck of cards.

  ## Examples
    ```
    iex> deck = Cards.create_deck()
    iex> shuffle_deck = Cards.shuffle(deck)
    iex> shuffle_deck != deck
    true
    ```

  """
  @spec shuffle(list(String.t())) :: list(String.t())
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Checks if a deck contains a card.

  ## Examples
    ```
    iex> deck = Cards.create_deck()
    iex> Cards.contains?(deck, "Ace of Spades")
    true
    ```
  """
  @spec contains?(list(String.t()), String.t()) :: boolean()
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Deals a hand of cards from a deck.

  ## Examples
    ```
    iex> deck = Cards.create_deck()
    iex> {hand, rest} = Cards.deal(deck, 5)
    iex> hand
    ["Ace of Spades", "King of Spades", "Queen of Spades", "Jack of Spades", "10 of Spades"]
    iex> rest
    ["9 of Spades", "8 of Spades", "7 of Spades", "6 of Spades", "5 of Spades", "4 of Spades", "3 of Spades", "2 of Spades", "Ace of Hearts", "King of Hearts", "Queen of Hearts", "Jack of Hearts", "10 of Hearts", "9 of Hearts", "8 of Hearts", "7 of Hearts", "6 of Hearts", "5 of Hearts", "4 of Hearts", "3 of Hearts", "2 of Hearts", "Ace of Clubs", "King of Clubs", "Queen of Clubs", "Jack of Clubs", "10 of Clubs", "9 of Clubs", "8 of Clubs", "7 of Clubs", "6 of Clubs", "5 of Clubs", "4 of Clubs", "3 of Clubs", "2 of Clubs", "Ace of Diamonds", "King of Diamonds", "Queen of Diamonds", "Jack of Diamonds", "10 of Diamonds", "9 of Diamonds", "8 of Diamonds", "7 of Diamonds", "6 of Diamonds", "5 of Diamonds", "4 of Diamonds", "3 of Diamonds", "2 of Diamonds"]
    ```
  """
  @spec deal(list(String.t()), integer()) :: {list(String.t()), list(String.t())}
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Saves a deck of cards to a file.

  ## Examples
    ```
    iex> deck = Cards.create_deck()
    iex> Cards.save(deck, "my_deck.bin")
    :ok
    ```
  """
  @spec save(list(String.t()), String.t()) :: :ok
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Loads a deck of cards from a file.

  ## Examples
    ```
    iex> Cards.load("my_deck.bin")
    ["Ace of Spades", "King of Spades", "Queen of Spades", "Jack of Spades", "10 of Spades", "9 of Spades", "8 of Spades", "7 of Spades", "6 of Spades", "5 of Spades", "4 of Spades", "3 of Spades", "2 of Spades", "Ace of Hearts", "King of Hearts", "Queen of Hearts", "Jack of Hearts", "10 of Hearts", "9 of Hearts", "8 of Hearts", "7 of Hearts", "6 of Hearts", "5 of Hearts", "4 of Hearts", "3 of Hearts", "2 of Hearts", "Ace of Clubs", "King of Clubs", "Queen of Clubs", "Jack of Clubs", "10 of Clubs", "9 of Clubs", "8 of Clubs", "7 of Clubs", "6 of Clubs", "5 of Clubs", "4 of Clubs", "3 of Clubs", "2 of Clubs", "Ace of Diamonds", "King of Diamonds", "Queen of Diamonds", "Jack of Diamonds", "10 of Diamonds", "9 of Diamonds", "8 of Diamonds", "7 of Diamonds", "6 of Diamonds", "5 of Diamonds", "4 of Diamonds", "3 of Diamonds", "2 of Diamonds"]
    ```
  """
  @spec load(String.t()) :: list(String.t()) | String.t()
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

  @doc """
    Creates a hand of cards.

  ## Examples
    ```
    iex> {hand, rest} = Cards.create_hand(2)
    iex> length(hand) == 2
    true
    iex> length(rest) == 50
    true
    ```
  """
  @spec create_hand(integer()) :: {list(String.t()), list(String.t())}
  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
