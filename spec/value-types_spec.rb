require_relative './spec_helper'

describe 'value types' do
  describe 'when object is valid' do
    before do
      @instances = []
      @instances << A.create(:id => 1, :line => 'string', :tags => [])
      @instances << A.create('id' => 1, 'line' => 'string', 'tags' => [])
    end

    it "responds to getters" do
      @instances.each do |i|
        i.id.must_equal 1
        i.line.must_equal 'string'
        i.tags.must_equal []
      end
    end

    it "responds to #values" do
      @instances.each do |instance|
        new_instance = A.create instance.values

        new_instance.id.must_equal 1
        new_instance.line.must_equal 'string'
        new_instance.tags.must_equal []
      end
    end
  end

  describe 'when object is invalid' do
    it "raises error" do
      ->{ A.create :id => "ololo(which don't look like Integer very much)" }
        .must_raise ArgumentError
    end
  end
end
