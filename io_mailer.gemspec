# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'io_mailer/version'

Gem::Specification.new do |spec|
  spec.name          = 'io_mailer'
  spec.version       = IOMailer::VERSION
  spec.authors       = ["Julian Weber"]
  spec.email         = ["jweber@anynines.com"]
  spec.description   = %q{IOMailer is a simple script for executing commands and shell scripts, collecting their output and mailing it to designated email addresses.}
  spec.summary       = %q{IOMailer is a simple script for executing commands and shell scripts, collecting their output and mailing it to designated email addresses.}
  spec.homepage      = "http://anynines.com"
  spec.license       = ""

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry-debugger'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'letter_opener'  

  spec.add_dependency 'actionmailer' , '~> 4.0.0'
  spec.add_dependency 'whenever'
end
