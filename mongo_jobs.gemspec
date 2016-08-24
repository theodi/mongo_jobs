# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongo_jobs/version'

Gem::Specification.new do |spec|
  spec.name          = 'mongo_jobs'
  spec.version       = MongoJobs::VERSION
  spec.authors       = ['pikesley']
  spec.email         = ['sam.pikesley@theodi.org']

  spec.summary       = %q{Mongo backup/restore tasks}
  spec.description   = %q{Mongo backup/restore tasks}
  spec.homepage      = 'https://github.org/theodi'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'fog', '~> 1.38'
  spec.add_dependency 'mongo', '~> 2.2'
  spec.add_dependency 'mime-types', '~> 3.1' # because of a bug in fog
  spec.add_dependency 'dotenv', '~> 2.1'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'curacao', '~> 0.1'
end
