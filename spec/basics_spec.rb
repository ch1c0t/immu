require_relative './spec_helper'

describe Immu do
  before do
    @a = A.new :id => 1, :string => 'string', :tags => []
  end

  it "responds to getters" do
    @a.id.must_equal 1
    @a.string.must_equal 'string'
    @a.tags.must_equal []
  end

  it "responds to #values" do
    a1 = A.new @a.values

    a1.id.must_equal 1
    a1.string.must_equal 'string'
    a1.tags.must_equal []
  end
end
