module Immu
  module Repo
    extend self

    @@instances = []

    def save instance
      @@instances << instance
    end

    def all
      @@instances
    end
  end
end
