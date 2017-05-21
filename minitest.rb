require 'minitest/autorun'
require './data/demo'

class TestDemo < Minitest::Test
  def setup
    @demo = Demo.new
  end

  def test_title_is_hello
    assert_equal "Hello", @demo.title
  end
end
