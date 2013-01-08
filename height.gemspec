# -*- encoding: utf-8 -*-
require File.expand_path('../lib/height/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Alexander Zaytsev"]
  gem.email         = ["alexander@say26.com"]
  gem.description   = %q{Height support for metric and imperial systems}
  gem.summary       = %q{Convert height between metric and imperial systems}
  gem.homepage      = "http://github.com/AlexanderZaytsev/height"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "height"
  gem.require_paths = ["lib"]
  gem.version       = Height::VERSION

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'i18n'
end
