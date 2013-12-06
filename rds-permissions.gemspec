# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rds/permissions/version'

Gem::Specification.new do |gem|
  gem.authors       = ["Jo"]
  gem.email         = ["jo@smartsoftasia.com"]
  gem.description   = "RDS permissions gem"
  gem.summary       = "RDS permissions gem"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rds-permissions"
  gem.require_paths = ["lib"]
  gem.version       = Rds::Permissions::VERSION
end
