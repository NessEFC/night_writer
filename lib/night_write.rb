require './lib/to_braille'
require 'pry'

input_text = File.read("./lib/" + ARGV[0]).chomp
contents = ToBraille.new(input_text)

output_text = contents.capital_check
File.write("./lib/" + ARGV[1], output_text)

def text_length(output_text)
  output_text.length - (output_text.scan(/\n/).count)
end

puts "Created ‘#{ARGV[1]}’ containing #{text_length(output_text)} characters."
