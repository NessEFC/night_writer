require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/to_english'

class ToEnglishTest < Minitest::Test
  attr_reader :english, :test_input

  def setup
    @english = ToEnglish.new("0.0.0.0.0.\n00.00.0..0\n....0.0.0.")
  end

  def test_does_it_create_instance_with_braille_input
    assert english
  end

  def test_it_splits_string_on_new_line
    expected = ["0.0.0.0.0.", "00.00.0..0", "....0.0.0."]

    assert_equal expected, english.split_lines
  end

  def test_zip
    expected = [["0.", "00", ".."], ["0.", ".0", ".."], ["0.", "0.", "0."], ["0.", "0.", "0."], ["0.", ".0", "0."]]

    assert_equal expected, english.braille_characters
  end

  def test_does_it_find_enlish_letters
    english = ToEnglish.new("0.0.\n..0.\n....")
    expected = "ab"

    assert_equal expected, english.translate
  end

  def test_does_it_find_capitals
    english = ToEnglish.new("..0...0.\n......0.\n.0...0..")
    expected = "AB"

    assert_equal expected, english.translate
  end

end
