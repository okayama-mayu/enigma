require 'pry'
require './lib/enigma_decrypt'
require 'date'

RSpec.describe EnigmaDecrypt do
  before :each do
    @enigma_decrypt = EnigmaDecrypt.new
  end

  it 'is an EnigmaDecrypt' do
    expect(@enigma_decrypt).to be_instance_of EnigmaDecrypt
  end
end
