require 'pry'
require './lib/enigma'
require 'date'
# ARGV == ["message.txt", "encrypted.txt"]
original_message = File.open(ARGV[0], "r")
encrypted_message = File.open(ARGV[1], "w")
original_text = original_message.read
encrypted_text = Enigma.new.encrypt(original_text)
encrypted_message.write(encrypted_text[:encryption])
encrypted_message.close

puts "Created '#{ARGV[1]}' with the key #{encrypted_text[:key]} and date #{encrypted_text[:date]}"
