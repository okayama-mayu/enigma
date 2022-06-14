require './lib/key'
require 'pry'

RSpec.describe Key do
  before :each do
    @key = Key.new
  end

  it 'is a key' do
    expect(@key).to be_instance_of Key
  end

  it 'generates a random key' do
    expect(@key.key.size).to eq 5
    expect(@key.key.class).to eq String
  end
end
