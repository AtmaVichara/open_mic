require_relative 'joke'
require 'csv'

class User
  attr_reader :name, :jokes

  def initialize(name)
    @name     = name
    @jokes    = Array.new
  end

  def learn(joke)
    jokes << joke
  end

  def tell(recipient, joke)
    recipient.jokes << joke
  end

  def perform_routine_for(recipient)
    recipient.jokes << jokes
    recipient.jokes.flatten!
  end

  def learn_routine(file)
    reader = CSV.open(file, 'r')
    reader.shift
    array = []
    array = reader.map do |lines|
      Joke.new({id: lines[0], question: lines[1], answer: lines[2]})
    end
    jokes << array
    jokes.flatten!
  end

end
