require_relative '../spec_helper'

describe 'in-memory repo' do
  describe '::save' do
    before do
      @instances = []
      @instances << A.create(:id => 1, :line => 'string', :tags => [])
      @instances << A.create('id' => 2, 'line' => 'second string', 'tags' => [])
      @instances << A.create(:id => 3, :line => 'third string', :tags => [])
    end

    it "saves instances" do
      @instances.each do |instance|
        A::Repo.save instance
      end

      A::Repo.all.must_equal @instances
    end
  end
end
