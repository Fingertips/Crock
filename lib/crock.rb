module JSON
  def self.generate(object)
    serialize(object)
  end
  
  def self.serialize(object)
    case object
    when Hash
      self.serialize_hash(object)
    when String
      "\"#{object}\""
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
  
  def self.serialize_hash(object)
    out = '{'
    for name, value in object
      out << JSON.serialize(name) << ':' << JSON.serialize(value)
    end
    out << '}'
  end
end