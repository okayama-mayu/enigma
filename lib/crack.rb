# $ ruby ./lib/encrypt.rb message.txt encrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 240818
# $ ruby ./lib/crack.rb encrypted.txt cracked.txt 240818
# Created 'cracked.txt' with the cracked key 82648 and date 240818

require 'pry'
require './lib/enigma_crack_v3'
require 'date'
# ARGV == ["encrypted.txt", "cracked.txt", date]
encrypted_message = File.open(ARGV[0], "r")
decrypted_message = File.open(ARGV[1], "w")
encrypted_text = encrypted_message.read
decrypted_text = Crack.new.crack(encrypted_text, ARGV[2])
decrypted_message.write(decrypted_text[:decryption])
decrypted_message.close
puts "Created '#{ARGV[1]}' with the cracked key #{decrypted_text[:key]} and date #{decrypted_text[:date]}"
