require 'pry'
require './lib/enigma_crack_v2'
require './lib/enigma_encrypt'
require 'date'

RSpec.describe EnigmaCrack do
  before :each do
    @crack = EnigmaCrack.new
    @encrypter = Encrypt.new
  end

  it 'is an EnigmaCrack' do
    expect(@crack).to be_instance_of Enigmacrack
  end

  it 'has a character set' do
    expect(@crack.character_set.count).to eq 27
    expect(@crack.character_set[0]).to eq "a"
    expect(@crack.character_set[-1]).to eq " "
  end

  it 'has shifts' do
    expect(@crack.shifts).to eq([:a, :b, :c, :d])
  end

  it 'can generate todays date' do
    expect(@crack.date).to eq(Date.today.strftime("%e%m%y"))
  end

  it 'has a default key' do
    expect(@crack.key.size).to eq 5
    expect(@crack.key.class).to eq String
  end

  it 'can return an array of index positions of the last 4 chars in the ciphertext' do
    expect(@crack.encrypted_index_array("vjqtbeaweqihssi")).to eq [7, 18, 18, 8]
  end

  it 'can return an array of the offsets rotated so the first offset element matches the empty space in _end' do
    expect(@crack.rotated_offset("vjqtbeaweqihssi", "291018")).to eq [4, 6, 3, 2]
  end

  it 'can return an array of index positions of the last 4 chars in the original text' do
    expect(@crack.original_index).to eq [26, 4, 13, 3]
  end

  xit 'can crack an encryption with a date' do
    expect(@encrypter.encrypt("hello world end", "08304", "291018")).to eq({
        encryption: "vjqtbeaweqihssi",
        key: "08304",
        date: "291018"
      })
    expect(@crack.crack("vjqtbeaweqihssi", "291018")).to eq({
        decryption: "hello world end",
        date: "291018",
        key: "08304"
      })
  end
end
