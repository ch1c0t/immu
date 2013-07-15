require "immu/version"
require "immu/helpers"
require "immu/repo"

module Immu
  include Helpers
  
  def self.included model
    model.class_eval do
      extend Helpers
      include Repo

      class << self
        @@values = {}
        
        def val value, type, options = {}
          dogged_value = doggieze value

          define_method(value) do
            instance_variable_get dogged_value
          end

          @@values[value] = { type: type, default: options[:default] }
        end

        def create args = {}
          args.each do |k, v|
            raise ArgumentError.new('Invalid type') unless v.is_a?(@@values[k.to_sym][:type])
          end

          new_args = {}
          @@values.each do |value, options|
            new_args[value] = args[value] || args[value.to_s] || options[:default]
          end

          self.new new_args
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
