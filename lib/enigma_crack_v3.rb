require_relative 'enigma'
require_relative 'decryptable'

class Crack < Enigma
  include Decryptable

  attr_reader :original_index

  def initialize
    super
    @original_index = " end".split("").map { |char|
      char_index(char) }
  end

  def crack(ciphertext, date = @date)
    ciphertext = ciphertext.strip.downcase
    {
      decryption: crack_message(ciphertext, date).join,
      key: @keys,
      date: date
    }
  end

  def crack_message(ciphertext, date)
    decrypt_message(ciphertext, final_keys(ciphertext, date), date)
  end

  def final_keys(ciphertext, date)
    rotate_shift(ciphertext)
    generate_random_key
    until decrypt_message(ciphertext[-4..-1], @keys, date) == [" ", "e", "n", "d"]
      generate_random_key
    end
    @shifts = [:a, :b, :c, :d]
    @keys
  end

  def rotate_shift(ciphertext)
    space_shift = space_index(ciphertext) % @shifts.count
    @shifts.rotate!(space_shift)
  end

  def space_index(ciphertext)
    ciphertext.split("").find_index(ciphertext.split("")[-4])
  end

  def generate_random_key
    @keys = '%05d' % rand(0..99999)
  end
end
