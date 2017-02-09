require "minitest/pride"
require "minitest/autorun"
require "./lib/dictionary"
require "./lib/reader_file"

class DictionaryTest < Minitest::Test

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
end
