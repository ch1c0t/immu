require_relative './helpers'

module Immu
  class Collection
    extend Helpers

    class << self
      def create hash
        self.new hash
      end
    end

    def initialize hash
    end
  end
end
