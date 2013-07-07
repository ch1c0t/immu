module Immu
  module ClassMethods
    include Helpers

    def val value
      doggiezed_value = doggieze value

      define_method(value) do
        instance_variable_get doggiezed_value
      end
    end
  end
end
