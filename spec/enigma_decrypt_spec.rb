require 'pry'
require './lib/enigma_decrypt'
require 'date'

RSpec.describe EnigmaDecrypt do
  before :each do
    @enigma_decrypt = EnigmaDecrypt.new
    @enigma = Enigma.new
    @encrypated = @enigma.encrypt("hello world", "02715")
  end

  it 'is an EnigmaDecrypt' do
    expect(@enigma_decrypt).to be_instance_of EnigmaDecrypt
  end

  it 'has a character set' do
    expect(@enigma_decrypt.character_set.count).to eq 27
    expect(@enigma_decrypt.character_set[0]).to eq "a"
    expect(@enigma_decrypt.character_set[-1]).to eq " "
  end

  it 'has shifts' do
    expect(@enigma_decrypt.shifts).to eq([:a, :b, :c, :d])
  end

  it 'can generate todays date' do
    expect(@enigma_decrypt.date).to eq(Date.today.strftime("%e%m%y"))
  end

  it 'can decrypt a message with a key and date' do
    expect(@enigma_decrypt.decrypt("keder ohulw", "02715", "040895")).to eq({
        decryption: "hello world",
        key: "02715",
        date: "040895"
      })
  end

  xit 'decrypt a message with a key and use todays date' do
    expect(@enigma_decrypt.decrypt(@encrypted[:encryption], "02715")). to eq({
        decryption: "hello world",
        key: "02715",
        date: Date.today.strftime("%e%m%y")
      })
  end
end
