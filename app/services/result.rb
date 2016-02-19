class Result
  WIN = :win
  LOSS = :loss
  TIE = :tie

  OUTCOMES = {
    0 => TIE,
    1 => WIN,
    -1 => LOSS
  }

  attr_reader :submitted_sign

  def initialize(submitted_sign)
    @submitted_sign = submitted_sign
  end

  def generated_sign
    @generated_sign ||= Sign.random
  end

  def outcome
    OUTCOMES[@submitted_sign <=> generated_sign]
  end
end
