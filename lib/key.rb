class Key
  attr_reader :key

  def initialize
    @key = '%05d' % rand(0..99999)
  end
end
