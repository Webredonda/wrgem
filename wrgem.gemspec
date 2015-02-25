# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wrgem/version'

Gem::Specification.new do |spec|
  spec.name          = "wrgem"
  spec.version       = Wrgem::VERSION
  spec.authors       = ["davidleandro"]
  spec.email         = ["david.leandro@grupogladium.com.br"]
  spec.summary       = %q{Framework utilizado pelo Grupo Gladium}
  spec.description   = %q{Generators para startar projeto e criar admin}
  spec.homepage      = ""

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
