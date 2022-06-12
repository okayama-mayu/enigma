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
    #turn ciphertext into array of chars (using split)
    #find index position of last 4 letters in order to find shift associated with the first of the final 4 chars
    # find offsets associated with each shift using the date (use Enigma#create_offsets)
    # find index position of each of the last 4 letters within the character set
    # for each of the last 4 letters: subtract from it the index position of the corresponding letter in ("_end") AND subtract from it the associated offset
    ciphertext_array = ciphertext.split("")
    last_4_char = ciphertext_array[-4..-1]
    shift_position_for_space_char = ciphertext_array.find_index(last_4_char[0]) % 4
    offsets = create_offsets(date).rotate!(shift_position_for_space_char)
    #index position of last 4 char in ciphertext
    last_4_index_pos = last_4_char.map { |char| char_index(char) }

    #create arrays within an array:
    #[0] = index positions of the last 4 characters in the ciphertext
    #[1] = index positions of "_end" (last 4 chars in the original text)
    #[2] = offsets, but rotated so the shift matches the appropriate char
    index_positions = []
    index_positions << last_4_index_pos << @_end_index_position << offsets
    keys = index_positions.transpose.map do |triple|
      binding.pry
      triple.reduce(:-)
      # % @character_set.count

    end
    binding.pry

  end
end
