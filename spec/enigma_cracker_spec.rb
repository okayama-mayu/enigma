require 'pry'
require './lib/enigma_cracker'
require 'date'

RSpec.describe EnigmaCracker do
  before :each do
    @crakcer = EnigmaCracker.new
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
end
