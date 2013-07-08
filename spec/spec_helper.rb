require 'immu'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class A
  include Immu

  val :id,     Integer
  val :string, String
  val :tags,   Array
end
