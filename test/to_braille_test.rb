require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/to_braille'

class ToBrailleTest < Minitest::Test
  def test_does_it_output_my_message
    skip
    braille = ToBraille.new("hello world")
    assert_equal "hello world", braille.input_text
  end

  def test_does_it_break_up_into_characters
    skip
    braille = ToBraille.new("hello world")
    assert_equal ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"], braille.split_text
  end

  def test_does_it_assign_all_braille_letters
    skip
    braille = ToBraille.new("hello")
    assert_equal [["0.","00",".."], ["0.",".0",".."], ["0.","0.","0."], ["0.","0.","0."], ["0.",".0","0."]], braille.translate
  end

  def test_the_top_line_is_correct
    skip
    braille = ToBraille.new("hello")
    assert_equal ["0.", "0.", "0.", "0.", "0."], braille.translate
  end

  def test_the_mid_line_is_correct
    skip
    braille = ToBraille.new("hello")
    assert_equal ["00", ".0", "0.", "0.", ".0"], braille.translate
  end

  def test_the_bottom_line_is_correct
    skip
    braille = ToBraille.new("hello")
    assert_equal ["..", "..", "0.", "0.", "0."], braille.translate
  end

  def test_does_the_output_appear_on_three_lines
    skip
    braille = ToBraille.new("hello")
    assert_equal "0.0.0.0.0.\n00.00.0..0\n....0.0.0.\n", braille.translate
  end

  def test_does_text_wrap_after_80_characters
    skip
    braille = ToBraille.new("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh")
    assert_equal ["hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh", "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh", "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"], braille.prepare_text
  end

  def test_does_split_text_get_called
    skip
    braille = ToBraille.new("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh")
    assert_equal true, braille.prepare_text
  end

  def test_it_goes_to_translate
    braille = ToBraille.new("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh")
    assert_equal true, braille.prepare_text
  end
end
