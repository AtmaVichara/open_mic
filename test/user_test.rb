require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/joke'
require 'csv'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test_joke_returns_empty_array
    duncan  = User.new("Duncan")

    assert_equal [], duncan.jokes
  end

  def test_learn_shovels_joke_object_in_jokes
    jocko   = User.new("Jocko")
    joke    = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    jocko.learn(joke)

    assert_instance_of Joke, jocko.jokes[0]
  end

  def  test_jokes_can_be_transferred_between_users
    joke        = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joe         = User.new("Joe")
    christopher = User.new("Christopher")

    joe.learn(joke)
    joe.tell(christopher, joke)

    assert_instance_of Joke, christopher.jokes[0]
    assert_equal 1, christopher.jokes.count
  end

  def test_perform_act_gives_all_jokes_to_user
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})

    iliza = User.new("Iliza")
    chris = User.new("Chris")

    iliza.learn(joke_1)
    iliza.learn(joke_2)
    iliza.perform_routine_for(chris)

    assert_instance_of Joke, chris.jokes[0]
    assert_equal 2, chris.jokes.count
  end

  def test_learn_routine_assigns_contents_to_user
    jordan = User.new("Jordan")
    jordan.learn_routine('./jokes.csv')

    require 'pry'; binding.pry
    assert_equal 100, jordan.jokes.count
  end

end
