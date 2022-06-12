require 'pry'
require './lib/enigma_decrypt'
require 'date'
# ARGV == ["encrypted.txt", "decrypted.txt", key, date]
# key = "02715", date = "040895"
encrypted_message = File.open(ARGV[0], "r")
decrypted_message = File.open(ARGV[1], "w")
encrypted_text = encrypted_message.read
decrypted_text = Decrypt.new.decrypt(encrypted_text, ARGV[2], ARGV[3])
decrypted_message.write(decrypted_text[:decryption])
decrypted_message.close
puts "Created '#{ARGV[1]}' with the key #{decrypted_text[:key]} and date #{decrypted_text[:date]}"
