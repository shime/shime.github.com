Gem::Specification.new do |spec|
  spec.name          = "minitest"
  spec.version       = "1.0.0"
  spec.authors       = ["Hrvoje Šimić"]
  spec.email         = ["shime@twobucks.co"]

  spec.summary       = %q{A tool for converting curl commands to other formats.}
  spec.homepage      = "https://github.com/shime/parse-curl"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.0'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 0.11.3"
end
