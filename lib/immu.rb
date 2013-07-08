require "immu/version"
require "immu/helpers"
require "immu/class_methods"

module Immu
  include Helpers
  
  def self.included model
    model.class_eval do
      extend ClassMethods
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
