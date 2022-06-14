require 'pry'
require './lib/enigma_crack_v3'
require './lib/enigma_encrypt'
require 'date'

RSpec.describe Crack do
  before :each do
    @crack = Crack.new
    @encrypter = Encrypt.new
  end

  it 'is an Crack' do
    expect(@crack).to be_instance_of Crack
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

  it 'can generate a random key' do
    expect(@crack.generate_random_key.size).to eq 5
    expect(@crack.key.class).to eq String
  end

  it 'can return the index position of the space char' do
    expect(@crack.space_index"vjqtbeaweqihssi").to eq(11)
  end

  it 'can rotate the shift to match the last 4 letters of the ciphertext' do
    expect(@crack.rotate_shift("vjqtbeaweqihssi")).to eq [:d, :a, :b, :c]
  end

  it 'can generate keys that produce desired condition' do
    expect(@crack.final_keys("vjqtbeaweqihssi", "291018")).to eq("08304")
  end

  it 'can crack an encryption with a date' do
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
