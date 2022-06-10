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
    expect(@enigma.create_keys("02715").keys.count).to eq 4
    expect(@enigma.create_keys("02715")).to eq({
        a: "02",
        b: "27",
        c: "71",
        d: "15"
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
