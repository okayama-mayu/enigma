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

  it 'has a character set' do
    expect(@enigma.character_set.count).to eq 27
    expect(@enigma.character_set[0]).to eq "a"
    expect(@enigma.character_set[-1]).to eq " "
  end

  it 'has shifts' do
    expect(@enigma.shifts).to eq([:a, :b, :c, :d])
  end

  it 'can create keys based on key input' do
    expect(@enigma.create_keys("02715").count).to eq 4
    expect(@enigma.create_keys("02715")).to eq([02, 27, 71, 15])
  end

  it 'can create offsets based on date' do
    expect(@enigma.create_offsets("040895")).to eq([1, 0, 2, 5])
  end

  it 'can create a final set of keys based on the keys and offsets' do
    expect(@enigma.create_final_keys("02715", "040895")).to eq({a: 3, b:27, c:73, d:20})
  end

  it 'can encrypt a single letter' do
    expect(@enigma.encrypt("h", "02715", "040895")).to eq({
      encryption: "k",
      key: "02715",
      date: "040895"
    })
  end

  it 'can encrypt two letters' do
    expect(@enigma.encrypt("he", "02715", "040895")).to eq({
      encryption: "ke",
      key: "02715",
      date: "040895"
    })
  end

  it 'can encrypt a message' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eq({
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      })
  end

  it 'can find the index position of a character' do
    expect(@enigma.char_index("h")).to eq 7
    expect(@enigma.char_index("e")).to eq 4
  end

  it 'can tell you the count of letters by which the character should shift' do
    expect(@enigma.index_shift("02715", "040895")).to eq 3
  end

  it 'can generate todays date' do
    expect(@enigma.date).to eq(Date.today.strftime("%e%m%y"))
  end

  it 'can encrypt a message with a key and use todays date' do
    expect(@enigma.encrypt("hello world", "02715")).to eq({
      encryption: "pmjdwhugztb",
      key: "02715",
      date: Date.today.strftime("%e%m%y")
      })
  end

  xit 'generates a random key if no key is passed in' do
    expect(@key.size).to eq 5
    expect(@key.class).to eq String
    expect(@key.to_i.class).to eq Integer
  end
end
