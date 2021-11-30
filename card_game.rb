class Player
  attr_accessor :score, :hand
  attr_reader :dealer, :name

  def initialize(name)
    @name = name
    @score = 0
    @hand = []
    @dealer = false
  end
end

class Dealer < Player
  def initialize(name)
    super(name)
    @dealer = true
  end
end

class CardDeck

  RANKS = ['Ace', 'King', 'Queen', 'Jack', 10, 9, 8, 7, 6, 5, 4, 3 , 2]
  SUITS = ['Clubs', 'Diamonds', 'Hearts', 'Spades']

  def self.shuffle
    new.build_deck.shuffle
  end

  def build_deck
    RANKS.product(SUITS)
  end
end

class CardGame
  def play
    players = setup_players
    deal_cards(players)
    calculate(players)
    player = determine_winner(players)

    if player.dealer
      puts "The dealer is the winner with a score of #{player.score}."
    else
      puts "Player #{player.name} is the winner with a score of #{player.score}."
    end
  end

  def setup_players
    players = Array.new
    players.push(Dealer.new('dealer'))

    5.times do |i|
      players.push(Player.new(i))
    end

    players
  end

  def deal_cards(players)
    deck = CardDeck.shuffle

    players.each do |player|
      hand = deck.sample(2)
      player.hand = hand
      deck.delete(hand) # remove from deck since those cards are taken now.
    end
  end

  def calculate(players)
    players.each do |player|
      hand = player.hand
      first_card = convert_values(hand.first.first)
      second_card = convert_values(hand.last.first)

      player.score = first_card + second_card
    end
  end

  def convert_values(value)
    case value
    when 'Ace' then 1
    when 'Jack' then 11
    when 'Queen' then 12
    when 'King' then 13
    else
      return value
    end
  end

  def determine_winner(players)
    players.max_by { |player| player.score }
  end
end

game = CardGame.new.play
