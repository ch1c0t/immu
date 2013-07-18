require 'oj'

module Immu
  module Helpers

    def doggieze value
      value[0] == '@' ? value : "@#{value}"
    end

    def create_from_json json
      self.create Oj.load(json)
    end
  end
end
