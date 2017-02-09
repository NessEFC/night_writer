require 'pry'

class ToEnglish
  attr_accessor :input_braille

  def initialize(input_braille)
    @input_braille = input_braille
  end

  def translate
    translated_braille = braille_characters.map do |letter|
      reverse_alphabet[letter]
    end
    english = translated_braille.join
    capital_check(english)
  end

  def capital_check(english_text)
    english_text.gsub!(/\^./) { |letter| letter.upcase }
    english_text.gsub!(/\^/) { |letter| "" }
  end

  def split_lines
    input_braille.split("\n")
  end

  def braille_characters
    letter_1 = split_lines[0].scan(/../)
    letter_2 = split_lines[1].scan(/../)
    letter_3 = split_lines[2].scan(/../)

    letters = letter_1.zip(letter_2, letter_3)
  end

  def reverse_alphabet
    { ["0.", "..", ".."]=>"a",
      ["0.", "0.", ".."]=>"b",
      ["00", "..", ".."]=>"c",
      ["00", ".0", ".."]=>"d",
      ["0.", ".0", ".."]=>"e",
      ["00", "0.", ".."]=>"f",
      ["00", "00", ".."]=>"g",
      ["0.", "00", ".."]=>"h",
      [".0", "0.", ".."]=>"i",
      [".0", "00", ".."]=>"j",
      ["0.", "..", "0."]=>"k",
      ["0.", "0.", "0."]=>"l",
      ["00", "..", "0."]=>"m",
      ["00", ".0", "0."]=>"n",
      ["0.", ".0", "0."]=>"o",
      ["00", "0.", "0."]=>"p",
      ["00", "00", "0."]=>"q",
      ["0.", "00", "0."]=>"r",
      [".0", "0.", "0."]=>"s",
      [".0", "00", "0."]=>"t",
      ["0.", "..", "00"]=>"u",
      ["0.", "0.", "00"]=>"v",
      [".0", "00", ".0"]=>"w",
      ["00", "..", "00"]=>"x",
      ["00", ".0", "00"]=>"y",
      ["0.", ".0", "00"]=>"z",
      ["..", "00", "0."]=>"!",
      ["..", "..", "0."]=>"'",
      ["..", "0.", ".."]=>",",
      ["..", "..", "00"]=>"-",
      ["..", "00", ".0"]=>".",
      ["..", "0.", "00"]=>"?",
      ["..", "..", ".0"]=>"^",
      [".0", ".0", "00"]=>"number",
      ["..", "..", ".."]=>" " }
  end

end
