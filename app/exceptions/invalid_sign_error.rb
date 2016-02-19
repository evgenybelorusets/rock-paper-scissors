class InvalidSignError < StandardError
  def initialize(name)
    @name = name
  end

  def to_s
    "Unknown sign #{@name}"
  end
end
