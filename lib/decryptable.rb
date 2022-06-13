module Decryptable
  def decrypt_message(message, key, date)
    # need to put message in an array with each char as an element
    # iterate through the array and rotate the @character_set so that the char is at the front of the array
    # need to pull the char that matches encryption from @character_set
    # go the OPPOSITE direction as encryption; index_shift should be negative
    message.split("").map do |char|
      if @character_set.include?(char)
        @character_set.rotate(char_index(char))[-index_shift(key, date)]
      else
        char
      end
    end
  end
end
