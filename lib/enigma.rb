class Enigma
  attr_reader :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key, date)
    create_keys(key)
    create_offsets(date)
    create_final_keys
    encrypted_array = message.split("").map do |char|
      binding.pry
    end


  end

  def create_keys(key)
    key_arr = key.split("")
    @keys = key_arr.each_cons(2).map { |key| (key[0] + key[1]).to_i }
  end

  def create_offsets(date)
    date_squared = (date.to_i ** 2).to_s
    @offsets = (date_squared[-4..-1].split("")).map { |digit| digit.to_i }
  end

  def create_final_keys
    key_and_offsets = []
    key_and_offsets << @keys << @offsets
    final_keys = key_and_offsets.transpose.map { |pair| pair.reduce(:+) }
  end
end
