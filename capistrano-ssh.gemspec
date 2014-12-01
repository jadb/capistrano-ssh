lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-ssh'
  spec.version       = '0.0.1'
  spec.authors       = ['Jad Bitar']
  spec.email         = ['bitarjad@gmail.com']
  spec.description   = %q{SSH tasks for Capistrano v3.*}
  spec.summary       = %q{SSH tasks for Capistrano v3.*}
  spec.homepage      = 'https://github.com/jadb/capistrano-ssh'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '~> 3.0', '>= 3.0.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 0'
end
