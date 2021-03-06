require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require "pry"

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_round_exists
    # skip
    # binding.pry

    assert_instance_of Round, @round
  end

  def test_round_contains_correct_deck
    # skip
    # binding.pry

    assert_equal @deck, @round.deck
  end

  def test_turns_array_exists_and_is_nil
    # skip
    # binding.pry

    assert_equal [], @round.turns
  end

  def test_current_card_is_correct
    # skip
    # binding.pry
    assert_equal @deck.cards[0], @round.current_card
  end

  def test_it_can_initiate_turn_with_guess
    # skip
    new_turn = @round.take_turn("Juneau")
    # binding.pry

    assert_equal Turn, new_turn.class
    # check that card in turn is right
    # check that guess in turn is right
  end

  def test_it_can_create_the_correct_turn
    # skip
    new_turn = @round.take_turn("Juneau")
    # binding.pry

    assert new_turn.correct?
  end

  def test_it_can_record_and_return_turns
    # skip
    new_turn = @round.take_turn("Juneau")
    # binding.pry

    assert_equal [new_turn], @round.turns
  end

  def test_it_can_tell_how_many_guesses_have_been_correct
    # skip
    new_turn = @round.take_turn("Juneau")
    # binding.pry

    assert_equal 1, @round.number_correct
  end

  def test_it_can_tell_what_current_card_is_after_a_turn
    # skip
    new_turn = @round.take_turn("Juneau")
    # binding.pry

    assert_equal @deck.cards[1], @round.current_card
  end

  def test_it_can_count_total_turns
    # skip
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    # binding.pry
    assert_equal 2, @round.turns.count
  end

  def test_it_can_feedback_is_accurate
    # skip
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    # binding.pry
    assert_equal "Incorrect.", @round.turns.last.feedback
  end

  def test_it_can_provide_number_correct_guesses_total_and_by_category
    # skip
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    # binding.pry
    assert_equal 1, @round.number_correct
    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_it_can_provide_percent_correct
    # skip
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 50.0, @round.percent_correct
    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
  end

  def test_it_can_tell_current_card_again
    # skip
    new_turn = @round.take_turn("Juneau")
    @round.take_turn("Venus")
# binding.pry
    assert_equal @deck.cards[2], @round.current_card
  end
end
