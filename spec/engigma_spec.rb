require 'pry'
require './lib/enigma'
require 'date'

RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
  end

  it 'is an Enigma' do
    expect(@enigma).to be_instance_of Enigma
  end

  it 'can create keys based on key input' do
    expect(@enigma.create_keys("02715").count).to eq 4
    expect(@enigma.create_keys("02715")).to eq([02, 27, 71, 15])
  end

  it 'can create offsets based on date' do
    expect(@enigma.create_offsets("040895")).to eq([1, 0, 2, 5])
  end

  it 'can create a final set of keys based on the keys and offsets' do
    @enigma.create_keys("02715")
    @enigma.create_offsets("040895")
    expect(@enigma.create_final_keys).to eq([3, 27, 73, 20])
  end

  it 'has a character set' do
    expect(@enigma.character_set.count).to eq 27
    expect(@enigma.character_set[0]).to eq "a"
    expect(@enigma.character_set[-1]).to eq " "
  end

  it 'can encrypt a single letter' do
    expect(@enigma.encrypt("h", "02715", "040895")).to eq({
      encryption: "k",
      key: "02715",
      date: "040895"
    })
  end

  xit 'can encrypt a message' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    })

  end

  xit 'generates a random key if no key is passed in' do
    expect(@key.size).to eq 5
    expect(@key.class).to eq String
    expect(@key.to_i.class).to eq Integer
  end
end
