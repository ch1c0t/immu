require_relative './collection'

module Immu
  module Repo
    extend self

    @@instances = []

    def << instance
      @@instances << instance
    end

    def all
      @@instances
    end

    def where json
      Collection.new_from_json json
    end
  end
end
