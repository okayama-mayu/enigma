require 'pry'
require './lib/enigma'
require 'date'
# ARGV == ["message.txt", "encrypted.txt"]
secret_message = File.open(ARGV[0], "r")
encrypted_message = File.open(ARGV[1], "w")
secret_text = secret_message.read
enigma = Enigma.new
encrypted_text = enigma.encrypt(secret_text)
encrypted_message.write(encrypted_text[:encryption], encrypted_text[:key])
encrypted_message.close
binding.pry
