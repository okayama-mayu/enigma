require 'pry'
require './lib/enigma_decrypt'
require 'date'
# ARGV == ["encrypted.txt", "decrypted.txt", key, date]
encrypted_message = File.open(ARGV[0], "r")
original_message = File.open(ARGV[1], "w")
encrypted_text = encrypted_message.read
encrypted_text = Decrypt.new.decrypt(encrypted_text, ARGV[2], ARGV[3])
binding.pry 
encrypted_message.write(encrypted_text[:encryption])
encrypted_message.close

puts "Created '#{ARGV[1]}' with the key #{encrypted_text[:key]} and date #{encrypted_text[:date]}"
