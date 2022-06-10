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
end
