# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "equation_builder"
  gem.homepage = "http://github.com/maksar/equation_builder"
  gem.license = "MIT"
  gem.summary = %Q{Gem to build an equation from sequence of numbers and arithmetic operations, evaluation result of which will equal to specified number.}
  gem.description = %Q{By given list of numbers [1, 3, 4, 6] and list of available operators ['/', '-'] both with desired result (24), this gem will build an equasion 6/(1-3/4)}
  gem.email = "Maksar.mail@gmail.com"
  gem.authors = ["Alexander Shestakov"]

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'jeweler'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'autotest'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end
task :default => :spec
