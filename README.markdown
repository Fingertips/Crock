# Crock

A tiny pure Ruby library to serialize JSON.

    require 'crock'
    JSON.generate([
      12, 'Café',
      {'on' => true}
    ]) # => '[12,"Café",{"on":true}]'

## Why!?

1. It's just one file and easy to drop in your project when you don't want gems
2. It has a liberal license

## Limitations

For the output to be valid all strings should be encoded in UTF-8 and only characters from the Basic Multilingual Plane are supported. Currently no special notations for floats are supported so serializing them might result in invalid JSON.

---

_Crock was named in honor of Douglas Crockford. For other ethymology see your local dictionary._