Gem::Specification.new do |spec|
  spec.name = 'crock'
  spec.version = '0.1'
  
  spec.author = "Manfred Stienstra"
  spec.email = "manfred@fngtps.com"

  spec.summary = <<-EOF
    A tiny implementation of JSON serialization.
  EOF
  spec.description = <<-EOF
    Crock is a tiny implementation of JSON serialization in pure Ruby.
  EOF
  
  spec.files = ['lib/crock.rb']

  spec.has_rdoc = true
  spec.extra_rdoc_files = ['LICENSE']
  spec.rdoc_options << "--charset=utf-8"
end
