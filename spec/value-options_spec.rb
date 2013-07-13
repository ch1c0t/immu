require_relative './spec_helper'

describe 'value options' do
  describe 'default values' do
    it "assigns default" do
      a = A.create :line => 'line', :tags => []
      a.id.must_equal 0
    end
  end
end
