require './lib/to_english'
require 'pry'

input_text = File.read("./lib/" + ARGV[0]).chomp
contents = ToEnglish.new(input_text)

output_text = contents.translate
File.write("./lib/" + ARGV[1], output_text)

puts "Created ‘#{ARGV[1]}’ containing #{output_text.length} characters."
