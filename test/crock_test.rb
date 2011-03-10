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
    assert_equal '"\\\\"', JSON.generate("\\")
    assert_equal '"\""', JSON.generate('"')
    assert_equal '"\/"', JSON.generate('/')
    assert_equal '"\\b"', JSON.generate("\b")
    assert_equal '"\\f"', JSON.generate("\f")
    assert_equal '"\\n"', JSON.generate("\n")
    assert_equal '"\\r"', JSON.generate("\r")
    assert_equal '"\\t"', JSON.generate("\t")
  end
  
  def test_special_serialization
    assert_equal 'false', JSON.generate(false)
    assert_equal 'true', JSON.generate(true)
    assert_equal 'null', JSON.generate(nil)
  end
  
  def test_hash_serialization
    assert_equal '{}', JSON.generate({})
    assert_equal '{"spread":"Peanut Butter"}', JSON.generate({'spread' => 'Peanut Butter'})
    assert_equal '{"bread":"white","spread":"Peanut Butter"}', JSON.generate({'bread' => 'white', 'spread' => 'Peanut Butter'})
  end
  
  def test_array_serialization
    assert_equal '[]', JSON.generate([])
    assert_equal '[1]', JSON.generate([1])
    assert_equal '[1,2,"blue",{}]', JSON.generate([1,2,'blue',{}])
  end
  
  def test_documentation_example
    assert_equal '[12,"Café",{"on":true}]', JSON.generate([12, 'Café', {'on' => true}])
  end
end

class Person
  attr_accessor :name
  
  def to_json
    JSON.serialize(name)
  end
end

class CustomClassCrockTest < Test::Unit::TestCase
  def setup
    @person = Person.new
    @person.name = 'Olivia Wilde'
  end
  
  def test_custom_class_serialization
    assert_equal JSON.generate(@person.name), JSON.generate(@person)
  end
  
  def test_custom_class_serialization_within_other_object
    assert_equal '{"person":"Olivia Wilde"}', JSON.generate({'person' => @person})
  end
end