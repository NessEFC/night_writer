require 'pry'

class ToBraille
  attr_accessor :input_text

  def initialize(input_text)
    @input_text = input_text
  end

  def split_text(all_lines)
    all_lines.map do |element|
      translate(element.chars)
    end
  end

  def capital_check
    input_text.gsub!(/[A-Z]/) { |letter| "^" + letter.downcase }
    prepare_text
  end

  def prepare_text
    number_of_lines = (input_text.length.to_f / 40).ceil
    if number_of_lines > 1
      all_lines = []
      number_of_lines.times do |line|
        if input_text.length > 40
          all_lines[line] = input_text.slice!(0..39)
        else
          all_lines[line] = input_text.slice!(0..(input_text.length - 1))
        end
      end
      return split_text(all_lines).join
    else
      return translate(input_text.chars)
    end
  end

  def translate(letters)
    top, mid, bottom = [], [], []
    letters.each do |character|
      top << alphabet[character][0]
      mid << alphabet[character][1]
      bottom << alphabet[character][2]
    end
    total_array = []
    total_array << top.join << "\n" << mid.join << "\n" << bottom.join << "\n"
    total_array.join
  end

  def alphabet
    {"a" => ["0.","..",".."], "b" => ["0.","0.",".."], "c" => ["00","..",".."], "d" => ["00",".0",".."],
    "e" => ["0.",".0",".."], "f" => ["00","0.",".."], "g" => ["00","00",".."], "h" => ["0.","00",".."],
    "i" => [".0","0.",".."], "j" => [".0","00",".."], "k" => ["0.","..","0."], "l" => ["0.","0.","0."],
    "m" => ["00","..","0."], "n" => ["00",".0","0."], "o" => ["0.",".0","0."], "p" => ["00","0.","0."],
    "q" => ["00","00","0."], "r" => ["0.","00","0."], "s" => [".0","0.","0."], "t" => [".0","00","0."],
    "u" => ["0.","..","00"], "v" => ["0.","0.","00"], "w" => [".0","00",".0"], "x" => ["00","..","00"],
    "y" => ["00",".0","00"], "z" => ["0.",".0","00"], "!" => ["..","00","0."], "'" => ["..","..","0."],
    "," => ["..","0.",".."], "-" => ["..","..","00"], "." => ["..","00",".0"], "?" => ["..","0.","00"],
    "^" => ["..", "..", ".0"], "number" => [".0", ".0", "00"], " " => ["..","..",".."]}
  end
end
