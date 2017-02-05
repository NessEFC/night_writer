class WriterFile
  def write_to_braille(top, middle, bottom)
    filename = ARGV[1]
    output_file = File.open(filename, 'w')

    top.length.times do |line|
      outfile.write(top[line] << "\n")
      outfile.write(middle[line] << "\n")
      outfile.write(bottom[line] << "\n")
    end
    outfile.close
  end

  def write_to_English(text)
    filename = ARGV[1]
    output_file = File.open(filename, 'w')
    output_file.write(text)
    output_file.close
  end
end