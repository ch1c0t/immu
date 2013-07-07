module Immu
  module Helpers
    def doggieze value
      value[0] == '@' ? value : "@#{value}"
    end
  end
end
