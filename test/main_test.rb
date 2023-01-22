require "minitest/autorun"
require_relative "../lib/main"

class MainTest < Minitest::Test
  def test_sample
    assert_equal 'RUBY', 'ruby'.upcase
  end
end
