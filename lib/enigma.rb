class Enigma

  def initialize
  end

  def encrypt(message, key, date)
    create_keys(key)

  end

  def create_keys(key)
    key_arr = key.split("")
    keys = Hash.new
    keys[:a] = key_arr[0] + key_arr[1]
    keys[:b] = key_arr[1] + key_arr[2]
    keys[:c] = key_arr[2] + key_arr[3]
    keys[:d] = key_arr[3] + key_arr[4]
    keys
  end
end
