require_relative 'enigma'

class Encrypt < Enigma

  def initialize
    super
  end

  def encrypt(message, key = @key, date = @date)
    {
      encryption: encrypt_message(message.downcase, key, date).join,
      key: key,
      date: date
    }
  end

  def encrypt_message(message, key, date)
    # need to put message in an array with each char as an element
    # if the char isn't in the @character_set, return itself
    # else encrypt the char
    # iterate through the array and rotate the @character_set so that the char is at the front of the array
    # need to pull the char that matches encryption from @character_set
    message.split("").map do |char|
      if @character_set.include?(char)
        @character_set.rotate(char_index(char))[index_shift(key, date)]
      else
        char
      end
    end
  end
end
