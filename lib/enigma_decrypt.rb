require_relative 'enigma'

class EnigmaDecrypt < Enigma

  def initialize
    super
  end

  def decrypt(message, key, date = @date)
    {
      decryption: decrypt_message(message, key, date).join,
      key: key,
      date: date
    }
  end

  def decrypt_message(message, key, date)
    # need to put message in an array with each char as an element
    # iterate through the array and rotate the @character_set so that the char is at the front of the array
    # need to pull the char that matches encryption from @character_set
    # go the OPPOSITE direction as encryption; index_shift should be negative
    message.split("").map do |char|
      @character_set.rotate(char_index(char))[-index_shift(key, date)]
    end
  end
end
