class Joke

  attr_reader :id, :question, :answer

  def initialize(args = Hash.new)
    @id = args[:id]
    @question = args[:question]
    @answer = args[:answer]
  end

end
