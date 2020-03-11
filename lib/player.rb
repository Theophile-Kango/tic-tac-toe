class Player
  attr_reader :name, :sign, :choices
  def initialize(name, sign)
    @name = name
    @sign = sign
    @choices = []
  end

  def add_choice(choice)
    @choices << choice
  end
end
