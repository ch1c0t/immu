module Immu
  class Collection
    class << self
      def new_from_json json
        self.new
      end
    end
  end
end
