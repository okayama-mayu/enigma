require 'simplecov'
SimpleCov.start
# run 'rspec spec/spec_helper.rb' to run simplecov
# open coverage/index.html (in Terminal)

require_relative 'enigma_encrypt_spec'
require_relative 'enigma_decrypt_spec'
require_relative 'enigma_spec'
require_relative 'enigma_crack_spec_v3'
