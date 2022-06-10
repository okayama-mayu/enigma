class Enigma
  attr_reader :character_set, :shifts

  def initialize
    @character_set = ("a".."z").to_a << " "
    @shifts = [:a, :b, :c, :d]
  end

  def encrypt(message, key, date)
    {
      encryption: encrypt_message(message, key, date).join,
      key: key,
      date: date
    }
  end

  def encrypt_message(message, key, date)
    # need to put message in an array with each char as an element
    # iterate through the array and rotate the @character_set so that the char is at the front of the array
    # need to pull the char that matches encryption from @character_set
    message.split("").map do |char|
      @character_set.rotate(char_index(char))[index_shift(key, date)]
    end
  end

  def char_index(char)
    @character_set.find_index(char)
  end

  def index_shift(key, date)
    # @shift is the array of shifts (:a, :b, :c, :d)
    #take the hash returned by create_final_keys and call on the value associated with the current shift (the key to the hash) (e.g., create_final_keys[:a] = 3)
    #use modulo to account for keys that are larger than 27 (the number of available chars in @character_set) by dividing by 27 and finding the remainder
    #rotate! the @shifts array
    shift_count = create_final_keys(key, date)[@shifts.first] % @character_set.count
    @shifts.rotate!
    shift_count
  end

  def create_final_keys(key, date)
    #create an array with 2 elements: an array of the keys and an array of the offsets
    #transpose them into an array that adds up the matching key and offsets (first index of keys is summed with first index of offsets)
    #create hash that assigns each shift a 'final key' (e.g., :a => 3)
    key_and_offsets = []
    key_and_offsets << create_keys(key) << create_offsets(date)
    combined = key_and_offsets.transpose.map { |pair| pair.reduce(:+) }
    @final_keys = {a: combined[0], b: combined[1], c: combined[2], d: combined[3]}
  end

  def create_keys(key)
    #take key and split into an array of digits in string form
    #take each 2 consecutive element and add them up to create the keys
    keys = key.split("").each_cons(2).map { |key| (key[0] + key[1]).to_i }
  end

  def create_offsets(date)
    #turn date into integers and square it
    #take the last four digits of the result and create and array of those 4 digits
    date_squared = (date.to_i ** 2).to_s
    offsets = (date_squared[-4..-1].split("")).map { |digit| digit.to_i }
  end
end
