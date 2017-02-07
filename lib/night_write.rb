require './lib/to_braille'
require 'pry'

input_text = File.read("./lib/" + ARGV[0]).chomp
contents = ToBraille.new(input_text)

output_text = contents.translate
File.write("./lib/" + ARGV[1], output_text)

def text_length(output_text)
  if output_text.end_with?("\n")
    output_text.length - 1
  else
    output_text.length
  end
end

puts "Created ‘#{ARGV[1]}’ containing #{text_length(output_text)} characters"
