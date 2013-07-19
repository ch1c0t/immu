require_relative './helpers'

module Immu
  class Collection
    extend Helpers
    include Enumerable

    class << self
      def create hash
        self.new hash
      end
    end

    def initialize hash
      @items = Repo.all.select { |item|  }
    end

    def each &b
      @items.each &b
    end
  end
end
