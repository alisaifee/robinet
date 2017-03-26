# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end
require 'rake'

require 'juwelier'
Juwelier::Tasks.new do |gem|
  gem.name = 'robinet'
  gem.homepage = 'http://github.com/alisaifee/robinet'
  gem.license = 'MIT'
  gem.summary = 'Rate limiting for rack applications'
  gem.description = "#{gem.summary}"
  gem.email = 'ali@indydevs.org'
  gem.authors = ['Ali-Akber Saifee']
  gem.add_dependency 'dry-configurable'
  gem.add_development_dependency 'rdoc', '~> 3.12'
  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.add_development_dependency 'juwelier', '~> 2.3'
  gem.add_development_dependency 'overcommit', '~> 0.33'
  gem.add_development_dependency 'reek', '~> 4.1'
  gem.add_development_dependency 'rubocop', '~> 0.44'
  gem.add_development_dependency 'coveralls'
  gem.add_development_dependency 'rspec', '~> 3.1.0'
  gem.add_development_dependency 'simplecov', '>= 0'
end
Juwelier::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

desc 'Code coverage detail'
task :simplecov do
  ENV['COVERAGE'] = 'true'
  Rake::Task['test'].execute
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "robinet #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
