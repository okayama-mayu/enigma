require_relative 'enigma'

class EnigmaCrack < Enigma
  attr_reader :original_index

  def initialize
    super
    @original_index = " end".split("").map { |char|
      char_index(char) }
  end

  def crack(ciphertext, date = @date)
    {
      decryption: crack_message(ciphertext.downcase, date).join,
      key: key,
      date: date
    }
  end

  def keys_array(ciphertext, date)
    keys_array = []
    @combined.each do |difference|
      if @combined.find_index(difference) == 0
        binding.pry
        keys_array << difference
      elsif keys_array[-1].split("")[-1] != '0'
        binding.pry
        sum = difference
        sum += @character_set.count until sum.split("")[0] == @combined[@combined.find_index(difference) - 1].split("")[-1]
        keys_array << sum
      else
        binding.pry
        keys_array << difference
      end
    end
    binding.pry
  end

  def rotate_to_shift_order
    space_shift = @space_index % @shifts.count
    if space_shift == 3
      @combined.rotate!(1)
    elsif space_shift == 2
      @combined.rotate!(2)
    elsif space_shift == 1
      @combined.rotate!(3)
    elsif space_shift == 0
      @combined
    end
  end

  def differences(ciphertext, date)
    # differences = [array of encrypted_index] - [offsets rotated to correct position] - [array of original_index]
    combined_array = []
    combined_array << encrypted_index_array(ciphertext) << rotated_offset(ciphertext, date) << @original_index
    @combined = combined_array.transpose.map do |triple|
      triple.reduce(:-) % 27
    end
  end

  def key_generator(combined)
    keys = {
      :a => combined[1],
      :b => combined[2]
    }
  end

  # def shift_encrypted_index_array
  #   space_index = ciphertext.split("").find_index(ciphertext.split("")[-4])
  #   space_shift = space_index % @shifts.count
  #   if space_shift == 3
  #     @index_array.rotate!(1)
  #   elsif space_shift == 2
  #     @index_array.rotate!(2)
  #   elsif space_shift == 1
  #     @index_array.rotate!(3)
  #   elsif space_shift == 0
  #     @index_array
  #   end
  #   binding.pry
  # end

  def encrypted_index_array(ciphertext)
    last4_char = ciphertext.split("")[-4..-1]
    @index_array = last4_char.map { |char| char_index(char) }
  end

  def rotated_offset(ciphertext, date)
    @space_index = ciphertext.split("").find_index(ciphertext.split("")[-4])
    rotation = @space_index % @shifts.count
    create_offsets(date).rotate!(rotation)
  end
end
