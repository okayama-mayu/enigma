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

  xit 'has shifts' do
    expect(@encrypt.shifts).to eq([:a, :b, :c, :d])
  end

  xit 'can generate todays date' do
    expect(@encrypt.date).to eq(Date.today.strftime("%e%m%y"))
  end

  xit 'has a default key' do
    expect(@encrypt.key.size).to eq 5
    expect(@encrypt.key.class).to eq String
  end
end
