require 'pry'
require './lib/enigma_encrypt'
require 'date'

RSpec.describe Encrypt do
  before :each do
    @encrypt = Encrypt.new
  end

  it 'is an Encrypt' do
    expect(@encrypt).to be_instance_of Encrypt
  end

  it 'has a character set' do
    expect(@encrypt.character_set.count).to eq 27
    expect(@encrypt.character_set[0]).to eq "a"
    expect(@encrypt.character_set[-1]).to eq " "
  end

  it 'has shifts' do
    expect(@encrypt.shifts).to eq([:a, :b, :c, :d])
  end

  it 'can generate todays date' do
    expect(@encrypt.date).to eq(Date.today.strftime("%e%m%y"))
  end

  it 'has a default key' do
    expect(@encrypt.key.size).to eq 5
    expect(@encrypt.key.class).to eq String
  end

  it 'can encrypt a single letter' do
    expect(@encrypt.encrypt("h", "02715", "040895")).to eq({
      encryption: "k",
      key: "02715",
      date: "040895"
    })
  end

  it 'can encrypt two letters' do
    expect(@encrypt.encrypt("he", "02715", "040895")).to eq({
      encryption: "ke",
      key: "02715",
      date: "040895"
    })
  end

  it 'can encrypt a message with a key and date' do
    expect(@encrypt.encrypt("hello world", "02715", "040895")).to eq({
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      })
  end

  it 'can encrypt a message with a key and use todays date' do
    expect(@encrypt.encrypt("hello world", "02715")).to eq({
      encryption: "pmjdwhugztb",
      key: "02715",
      date: Date.today.strftime("%e%m%y")
      })
  end

  it 'can encrypt a message regardless of capitalization' do
    expect(@encrypt.encrypt("HELLO WORLD", "02715", "040895")).to eq({
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      })
  end

  it 'can encrypt a message with a character not in the character set' do
    expect(@encrypt.encrypt("HELLO WORLD!", "02715", "040895")).to eq({
        encryption: "keder ohulw!",
        key: "02715",
        date: "040895"
      })
  end

  it 'generates a random key if no key is passed in' do
    expect(@encrypt.encrypt("hello world!")[:key].size).to eq 5
    expect(@encrypt.encrypt("hello world!")[:key].class).to eq String
    expect(@encrypt.encrypt("hello world!")[:date]).to eq Date.today.strftime("%e%m%y")
  end
end
