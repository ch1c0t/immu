require "immu/version"
require "immu/helpers"

module Immu
  include Helpers
  
  def self.included model
    model.class_eval do
      extend Helpers

      class << self

        @@values = {}
        
        def val value, type
          dogged_value = doggieze value

          define_method(value) do
            instance_variable_get dogged_value
          end

          @@values[value] = type
        end

        def create args = {}
          args.each do |k, v|
            raise ArgumentError.new('Invalid type') unless v.is_a?(@@values[k.to_sym])
          end
          self.new args
        end
      end
    end
  end

  def initialize args = {}
    args.each do |k, v|
      instance_variable_set doggieze(k), v
    end
  end

  def values
    instance_variables.each_with_object({}) do |variable, object|
      object[variable[1..-1]] = instance_variable_get variable
    end
  end
end
