class Sign
  ROCK = 'rock'.freeze
  PAPER = 'paper'.freeze
  SCISSORS = 'scissors'.freeze
  POSSIBLE_SIGNS = [ROCK, PAPER, SCISSORS]
  RULES = {
    ROCK => SCISSORS,
    PAPER => ROCK,
    SCISSORS => PAPER
  }

  attr_reader :name

  class << self
    def random
      new POSSIBLE_SIGNS.sample
    end
  end

  def initialize(name)
    if name.in?(POSSIBLE_SIGNS)
      @name = name
    else
      raise InvalidSignError.new(name)
    end
  end

  def <=>(sign)
    return 1 if RULES[name] == sign.name
    return -1 if RULES[sign.name] == name
    0
  end
end
