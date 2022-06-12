require_relative 'enigma_encrypt'

class EnigmaCracker < Enigma

  def initialize
    super
    @_end_index_position = " end".split("").map { |char|
      char_index(char) }
  end

  def crack(ciphertext, date = @date)
    {
      decryption: crack_message(ciphertext.downcase, date).join,
      key: key,
      date: date
    }
  end

  def crack_message(ciphertext, date)
    # keys = [array of encrypted_index] - [offsets rotated to correct position] - [array of original_index]
  end

  def encrypted_index_array(ciphertext)
    last4_char = ciphertext.split("")[-4..-1]
    last4_char.map { |char| char_index(char) }
  end


end
