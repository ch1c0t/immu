module Immu
  module ClassMethods
    include Helpers

    def val value
      dogged_value = doggieze value

      define_method(value) do
        instance_variable_get dogged_value
      end
    end
  end
end
