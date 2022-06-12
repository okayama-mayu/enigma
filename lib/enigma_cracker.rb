require_relative 'enigma_encrypt'

class EnigmaCracker < Enigma

  def initialize
    super
  end

  def crack(ciphertext, date = @date)
    #turn ciphertext into array of chars (using split)
    #find index position of last 4 letters in order to find shift associated with each
    # find offsets associated with each shift using the date 
    # find index position of each of the last 4 letters within the character set
    # for each of the last 4 letters: subtract from it the index position of the corresponding letter in ("_end") AND subtract from it the associated offset
  end
end
