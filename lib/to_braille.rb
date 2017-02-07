require 'pry'

class ToBraille
  attr_reader :input_text

  def initialize(input_text)
    @input_text = input_text
  end

  def split_text
    input_text.chars
  end

  def translate
    top, mid, bottom = [], [], []
    split_text.each do |character|
      # if capital, call a method
      # elsif number, call a method
      # else
      top << alphabet[character][0]
      mid << alphabet[character][1]
      bottom << alphabet[character][2]
    end
    total_array = []
    total_array << top.join << "\n" << mid.join << "\n" << bottom.join << "\n"
    total_array.join
    # output(total_array << top.join << "\n" << mid.join << "\n" << bottom.join << "\n", top.length * 2)
  end

  # def output(output, length)
  #   braille_three_lines = output.join

    # length_counter = length
    # until length_counter > output.join.length do
    #   braille_three_lines = braille_three_lines.insert(length_counter, "\n")
    #   length_counter += length
    #   binding.pry
    # end
    #braille_three_lines
    # if output is over 80 characters, insert the break after 80, else, do it the other way
  #end

  def alphabet
    {"a" => ["0.","..",".."], "b" => ["0.","0.",".."], "c" => ["00","..",".."], "d" => ["00",".0",".."],
    "e" => ["0.",".0",".."], "f" => ["00","0.",".."], "g" => ["00","00",".."], "h" => ["0.","00",".."],
    "i" => [".0","0.",".."], "j" => [".0","00",".."], "k" => ["0.","..","0."], "l" => ["0.","0.","0."],
    "m" => ["00","..","0."], "n" => ["00",".0","0."], "o" => ["0.",".0","0."], "p" => ["00","0.","0."],
    "q" => ["00","00","0."], "r" => ["0.","00","0."], "s" => [".0","0.","0."], "t" => [".0","00","0."],
    "u" => ["0.","..","00"], "v" => ["0.","0.","00"], "w" => [".0","00",".0"], "x" => ["00","..","00"],
    "y" => ["00",".0","00"], "z" => ["0.",".0","00"], "!" => ["..","00","0."], "'" => ["..","..","0."],
    "," => ["..","0.",".."], "-" => ["..","..","00"], "." => ["..","00",".0"], "?" => ["..","0.","00"],
    "capital" => ["..", "..", ".0"], "number" => [".0", ".0", "00"], " " => ["..","..",".."]}
  end
end

# braille = ToBraille.new("hello world")
# puts braille.translate
