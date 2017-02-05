require "minitest/pride"
require "minitest/autorun"
require "./lib/dictionary"

class DictionaryTest < Minitest::Test

  def setup
    
  end

  def test_that_hashes_load
    refute_nil english_to_braile_hash
    refute_nil letters_to_numbers
    assert_equal 34, english_to_braile_hash.count
    assert_equal 10, letters_to_numbers.count
  end

  def test_expected_hash_keys_and_values
    assert_equal ["0.","..",".."], english_to_braile_hash["a"]
    assert_equal ["..","0.","00"], english_to_braile_hash["?"]
    assert_equal "t", english_to_braile_hash.key([".0","00","0."])
    assert_equal "f", english_to_braile_hash.key(["00","0.",".."])
    assert_equal "7", letters_to_numbers["g"]
    assert_equal "e", letters_to_numbers.key("5")
  end

  def load_english_file_
    File.open("lib/english.txt", "r").read
  end

  def test_input_file
    skip
  end

  def test_message_string_split_to_array
    skip

  end


end