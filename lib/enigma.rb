class Enigma
  attr_reader :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key, date)
    create_keys(key)
    create_offsets(date)
    create_final_keys
    shifts = @final_keys.keys
    message_arr = message.split("")
    encrypted_array = []
    message_arr.each do |char|
      original_char_index = @character_set.find_index(char)
      new_char_index = @final_keys[shifts.first] % @character_set.count
      encrypted_array << @character_set.rotate(original_char_index)[new_char_index]
      shifts.rotate!
    end
    {
      encryption: encrypted_array.join,
      key: key,
      date: date
    }
  end

  def create_keys(key)
    @keys = key.split("").each_cons(2).map { |key| (key[0] + key[1]).to_i }
  end

  def create_offsets(date)
    date_squared = (date.to_i ** 2).to_s
    @offsets = (date_squared[-4..-1].split("")).map { |digit| digit.to_i }
  end

  def create_final_keys
    key_and_offsets = []
    key_and_offsets << @keys << @offsets
    combined = key_and_offsets.transpose.map { |pair| pair.reduce(:+) }
    @final_keys = {a: combined[0], b: combined[1], c: combined[2], d: combined[3]}
  end
end
