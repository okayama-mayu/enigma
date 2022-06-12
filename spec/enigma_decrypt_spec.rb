require 'pry'
require './lib/enigma_decrypt'
require 'date'

RSpec.describe Decrypt do
  before :each do
    @decrypt = Decrypt.new
    @enigma = Enigma.new
    @encrypted = @enigma.encrypt("hello world", "02715")
  end

  it 'is a Decrypt' do
    expect(@decrypt).to be_instance_of Decrypt
  end

  it 'has a character set' do
    expect(@decrypt.character_set.count).to eq 27
    expect(@decrypt.character_set[0]).to eq "a"
    expect(@decrypt.character_set[-1]).to eq " "
  end

  it 'has shifts' do
    expect(@decrypt.shifts).to eq([:a, :b, :c, :d])
  end

  it 'can generate todays date' do
    expect(@decrypt.date).to eq(Date.today.strftime("%e%m%y"))
  end

  it 'can decrypt a message with a key and date' do
    expect(@decrypt.decrypt("keder ohulw", "02715", "040895")).to eq({
        decryption: "hello world",
        key: "02715",
        date: "040895"
      })
  end

  it 'decrypt a message with a key and use todays date' do
    expect(@decrypt.decrypt(@encrypted[:encryption], "02715")). to eq({
        decryption: "hello world",
        key: "02715",
        date: Date.today.strftime("%e%m%y")
      })
  end

  it 'can decrypt a message with a key and date and characters that are not in the character set' do
    expect(@decrypt.decrypt("keder ohulw!", "02715", "040895")).to eq({
        decryption: "hello world!",
        key: "02715",
        date: "040895"
      })
  end
end
