require 'test/unit'

$:.unshift File.expand_path('../../lib', __FILE__)

require 'crock'

class CrockTest < Test::Unit::TestCase
  def test_integer_serialization
    assert_equal '1', JSON.generate(1)
    assert_equal '12', JSON.generate(12)
  end
  
  def test_string_serialization
    assert_equal '"monkey"', JSON.generate('monkey')
  end
  
  def test_special_serialization
    assert_equal 'false', JSON.generate(false)
    assert_equal 'true', JSON.generate(true)
    assert_equal 'null', JSON.generate(nil)
  end
  
  def test_hash_serialization
    assert_equal '{"spread":"Peanut Butter"}', JSON.generate({'spread' => 'Peanut Butter'})
  end
end