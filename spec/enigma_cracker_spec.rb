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
end
