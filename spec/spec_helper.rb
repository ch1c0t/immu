require 'immu'
require 'minitest/autorun'
require 'minitest/pride'

class A
  include Immu

  val :id
  val :string
  val :tags
end
