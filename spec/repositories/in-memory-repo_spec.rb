require_relative '../spec_helper'

describe 'in-memory repo' do
  before do
    @instances = []
    @instances << A.create(:id => 1, :line => 'string', :tags => [])
    @instances << A.create('id' => 2, 'line' => 'second string', 'tags' => [])
    @instances << A.create(:id => 3, :line => 'third string', :tags => [])

    @instances.each do |instance|
      A::Repo << instance
    end
  end

  describe '::all' do
    it "returns all instances" do
      A::Repo.all.must_equal @instances
    end
  end

  describe '::where' do
    it "returns Collection" do
      json = 'a json string'
      collection = A::Repo.where json

      assert collection.is_a?(Immu::Collection)
    end
  end
end
