require 'pry'
require './lib/enigma_cracker_v2'
require './lib/enigma_encrypt'
require 'date'

RSpec.describe EnigmaCracker do
  before :each do
    @cracker = EnigmaCracker.new
    @encrypter = Encrypt.new
  end

  it 'is an EnigmaCracker' do
    expect(@cracker).to be_instance_of EnigmaCracker
  end

  it 'has a character set' do
    expect(@cracker.character_set.count).to eq 27
    expect(@cracker.character_set[0]).to eq "a"
    expect(@cracker.character_set[-1]).to eq " "
  end

  it 'has shifts' do
    expect(@cracker.shifts).to eq([:a, :b, :c, :d])
  end

  it 'can generate todays date' do
    expect(@cracker.date).to eq(Date.today.strftime("%e%m%y"))
  end

  it 'has a default key' do
    expect(@cracker.key.size).to eq 5
    expect(@cracker.key.class).to eq String
  end

  it 'can return an array of index positions of the last 4 chars in the ciphertext' do
    expect(@cracker.encrypted_index_array("vjqtbeaweqihssi")).to eq [7, 18, 18, 8]
  end

  it 'can return an array of the offsets rotated so the first offset element matches the empty space in _end' do
    expect(@cracker.rotate_offset("vjqtbeaweqihssi", "291018")).to eq [4, 6, 3, 2]
  end

  xit 'can crack an encryption with a date' do
    expect(@encrypter.encrypt("hello world end", "08304", "291018")).to eq({
        encryption: "vjqtbeaweqihssi",
        key: "08304",
        date: "291018"
      })
    expect(@cracker.crack("vjqtbeaweqihssi", "291018")).to eq({
        decryption: "hello world end",
        date: "291018",
        key: "08304"
      })
  end
end
