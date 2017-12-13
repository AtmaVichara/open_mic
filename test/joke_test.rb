require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'

class JokeTest < Minitest::Test

  def test_joke_is_initialized_as_test_object
    joke = Joke.new

    assert_instance_of Joke, joke
  end

  def test_joke_has_id_key_as_attribute
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Bescause his mother was in a jam"})

    assert_equal 1, joke.id
  end

  def test_joke_has_question_key_as_attribute
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Bescause his mother was in a jam"})

    assert_equal "Why did the strawberry cross the road?", joke.question
  end

  def test_joke_has_answer_key_as_attribute
    joke = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Bescause his mother was in a jam"})

    assert_equal "Bescause his mother was in a jam", joke.answer
  end

end
