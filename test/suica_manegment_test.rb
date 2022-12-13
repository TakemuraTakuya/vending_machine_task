require 'minitest/autorun'
require_relative '../lib/suica_manegment'

class SampleTest < Minitest::Test 
  def test_sample
    assert Suica
  end
end
