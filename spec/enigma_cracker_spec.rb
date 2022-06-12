require 'pry'
require './lib/enigma_cracker'
require './lib/enigma_encrypt'
require 'date'

RSpec.describe EnigmaCracker do
  before :each do
    @crakcer = EnigmaCracker.new
    @encrypter = Enigma.new
  end

  it 'is an EnigmaCracker' do
    expect(@crakcer).to be_instance_of EnigmaCracker
  end

  it 'has a character set' do
    expect(@crakcer.character_set.count).to eq 27
    expect(@crakcer.character_set[0]).to eq "a"
    expect(@crakcer.character_set[-1]).to eq " "
  end

  it 'has shifts' do
    expect(@crakcer.shifts).to eq([:a, :b, :c, :d])
  end

  it 'can generate todays date' do
    expect(@crakcer.date).to eq(Date.today.strftime("%e%m%y"))
  end

  it 'has a default key' do
    expect(@crakcer.key.size).to eq 5
    expect(@crakcer.key.class).to eq String
  end

  it 'can crack an encryption with a date' do
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
