require 'pry'
# ARGV == ["message.txt", "encrypted.txt"]
binding.pry 
secret_message = File.open(ARGV[0], "r")
encrypted_message = File.open(ARGV[1], "w")
secret_text = secret_message.read
