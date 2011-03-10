# Ruby implementation of JSON serialization.
#
#   JSON.serialize([{'title' => 'Tron'}, 12]) # => "[{"title":"Tron"},12]"
class JSON
  REPLACEMENTS = {
    '\\' => '\\\\',
    '"'  => '\\"',
    '/'  => '\/',
    "\b" => '\\b',
    "\f" => '\\f',
    "\n" => '\\n',
    "\r" => '\\r',
    "\t" => '\\t'
  }
  
  # Serializes a Ruby object to a valid JSON expression.
  #
  #   JSON.serialize({'title' => 'Tron'}) # => '{"title":"Tron"}'
  #
  # You can serialize unsupported classes by defining the +to_json+ method
  # on them.
  #
  #   class Person
  #     attr_accessor :name
  #     def to_json
  #       JSON.serialize(name)
  #     end
  #   end
  def self.serialize(object)
    case object
    when Hash
      self.serialize_hash(object)
    when Array
      self.serialize_array(object)
    when String
      self.serialize_string(object)
    when FalseClass
      'false'
    when TrueClass
      'true'
    when NilClass
      'null'
    else
      object.respond_to?(:to_json) ? object.to_json : object.to_s
    end
  end
  
  class << self
    alias generate serialize
  end
  
  private
  
  def self.serialize_string(object) #:nodoc:
    escaped = object.gsub(/[\\\"\/\b\f\n\r\t]/) do |match|
      REPLACEMENTS[match]
    end
    "\"#{escaped}\""
  end
  
  def self.serialize_hash(object) #:nodoc:
    out = '{'
    first = true
    for name, value in object
      first ? first = false : out << ','
      out << JSON.serialize(name) << ':' << JSON.serialize(value)
    end
    out << '}'
  end
  
  def self.serialize_array(object) #:nodoc:
    out = '['
    first = true
    for value in object
      first ? first = false : out << ','
      out << JSON.serialize(value)
    end    
    out << ']'
  end
end