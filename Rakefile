require 'rake/testtask'
require 'rake/rdoctask'

task :default => :test

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

Rake::RDocTask.new do |rd|
  rd.main = "lib/crock.rb"
  rd.rdoc_files.include("LICENSE", "lib/**/*.rb")
  rd.options << "--all" << "--charset" << "utf-8"
end
