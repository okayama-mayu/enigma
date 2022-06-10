require 'pry'
# ARGV == ["quiet_quotes.txt", "loud_quotes.txt"]

loud_file = File.open(ARGV[1], "w")
quiet_file = File.open(ARGV[0], "r")
quiet_text = quiet_file.read
loud_text = quiet_text.upcase
loud_file.write(loud_text)
loud_file.close 
binding.pry
