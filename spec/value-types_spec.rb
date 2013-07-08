require_relative './spec_helper'

describe 'value types' do
  describe 'when object is valid' do
    before do
      @a = A.create :id => 1, :string => 'string', :tags => []
    end

    it "responds to getters" do
      @a.id.must_equal 1
      @a.string.must_equal 'string'
      @a.tags.must_equal []
    end

    it "responds to #values" do
      a1 = A.create @a.values

      a1.id.must_equal 1
      a1.string.must_equal 'string'
      a1.tags.must_equal []
    end
  end

  describe 'when object is invalid' do
    it "raises error" do
      ->{ A.create :id => "ololo(which don't look like Integer very much)" }
        .must_raise ArgumentError
    end
  end
end
