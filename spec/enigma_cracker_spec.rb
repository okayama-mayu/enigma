require 'pry'
require './lib/enigma_cracker'
require 'date'

RSpec.describe EnigmaCracker do
  before :each do
    @enigma_cracker = EnigmaCracker.new
  end

  it 'is an EnigmaCracker' do
    expect(@enigma_cracker).to be_instance_of EnigmaCracker
  end

  it 'has a character set' do
    expect(@enigma_cracker.character_set.count).to eq 27
    expect(@enigma_cracker.character_set[0]).to eq "a"
    expect(@enigma_cracker.character_set[-1]).to eq " "
  end

  it 'has shifts' do
    expect(@enigma_cracker.shifts).to eq([:a, :b, :c, :d])
  end

  it 'can generate todays date' do
    expect(@enigma_cracker.date).to eq(Date.today.strftime("%e%m%y"))
  end
end
