require_relative 'enigma_encrypt'

class EnigmaCrack < Enigma

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
    # @ciphertext_array = ciphertext.split("")
    # keys = [array of encrypted_index] - [offsets rotated to correct position] - [array of original_index]
  end

  def encrypted_index_array(ciphertext)
    @ciphertext_array = ciphertext.split("")
    last4_char = @ciphertext_array[-4..-1]
    last4_char.map { |char| char_index(char) }
  end

  def rotate_offset(ciphertext, date)
    @ciphertext_array = ciphertext.split("")
    space_index = @ciphertext_array.find_index(@ciphertext_array[-4])
    rotation = space_index % @shifts.count
    create_offsets(date).rotate!(rotation)
  end

end
