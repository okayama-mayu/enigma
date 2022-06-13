require_relative 'enigma_encrypt'
require_relative 'decryptable'

class Decrypt < Enigma
  include Decryptable

  def initialize
    super
  end

  def decrypt(message, key, date = @date)
    {
      decryption: decrypt_message(message.downcase, key, date).join,
      key: key,
      date: date
    }
  end
end
