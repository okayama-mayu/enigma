require_relative 'enigma'
require_relative 'decryptable'

class Crack < Enigma
  include Decryptable

  attr_reader :original_index

  def initialize
    super
    @original_index = " end".split("").map { |char|
      char_index(char) }
  end

  def crack(ciphertext, date = @date)
    {
      decryption: crack_message(ciphertext.strip.downcase, date).join,
      key: final_keys(ciphertext, date),
      date: date
    }
  end

  def crack_message(ciphertext, date)
    keys = final_keys(ciphertext, date)
    decrypt_message(ciphertext, keys, date)
  end

  def final_keys(ciphertext, date)
    nums_array = keys_array(ciphertext, date).map do |num|
      ('%02d' % num.to_s).split("")
    end
    keys = nums_array.flat_map do |nums|
      if nums_array.find_index(nums) == 3
        nums
      else
        nums[0]
      end
    end
    keys.join 
  end

  def keys_array(ciphertext, date)
    keys_array = []
    rotate_to_shift_order(ciphertext, date).each do |difference|
      if @combined.find_index(difference) == 0
        # binding.pry
        keys_array << difference
      elsif keys_array[-1].to_s.split("")[-1] != '0'
        # binding.pry
        sum = difference + @character_set.count
        sum += @character_set.count until sum.to_s.split("")[0] == keys_array[-1].to_s.split("")[-1]
        keys_array << sum
      else
        # binding.pry
        keys_array << difference
      end
    end
    keys_array
  end

  def rotate_to_shift_order(ciphertext, date)
    space_shift = space_index(ciphertext) % @shifts.count
    if space_shift == 3
      differences(ciphertext, date).rotate!(1)
    elsif space_shift == 2
      differences(ciphertext, date).rotate!(2)
    elsif space_shift == 1
      differences(ciphertext, date).rotate!(3)
    elsif space_shift == 0
      differences(ciphertext, date)
    end
  end

  def space_index(ciphertext)
    ciphertext.split("").find_index(ciphertext.split("")[-4])
  end

  def differences(ciphertext, date)
    # differences = [array of encrypted_index] - [offsets rotated to correct position] - [array of original_index]
    combined_array = []
    combined_array << encrypted_index_array(ciphertext) << rotated_offset(ciphertext, date) << @original_index
    @combined = combined_array.transpose.map do |triple|
      triple.reduce(:-) % 27
    end
  end

  def encrypted_index_array(ciphertext)
    last4_char = ciphertext.split("")[-4..-1]
    @index_array = last4_char.map { |char| char_index(char) }
  end

  def rotated_offset(ciphertext, date)
    rotation = space_index(ciphertext) % @shifts.count
    create_offsets(date).rotate!(rotation)
  end
end
