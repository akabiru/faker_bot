require_relative "lib/faker/bot/version"

Gem::Specification.new do |spec|
  spec.name          = "faker-bot"
  spec.version       = Faker::Bot::VERSION
  spec.authors       = ["Austin Kabiru"]
  spec.email         = ["makabby@gmail.com"]

  spec.summary       = %q{A faker-ruby/faker lookup command line tool.}
  spec.description   = %q{Quickly look up Faker methods without leaving your terminal!}
  spec.homepage      = "https://github.com/faker-ruby/faker-bot"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*", "CHANGELOG.md", "LICENSE.txt", "README.md"]
  spec.bindir        = "bin"
  spec.executables   = ["faker"]
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.5"

  spec.add_dependency "faker"
  spec.add_dependency "pastel", "~> 0.7"
  spec.add_dependency "thor", ">= 0.20", "< 1.2"
  spec.add_dependency "tty-pager", "~> 0.13"
  spec.add_dependency "tty-screen", "~> 0.8"
  spec.add_dependency "tty-tree", "~> 0.4"

  spec.add_development_dependency "bundler", ">= 1.16"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.18.2"
  # Workaround for cc-test-reporter with SimpleCov 0.18.
  # Stop upgrading SimpleCov until the following issue will be resolved.
  # https://github.com/codeclimate/test-reporter/issues/418
  spec.add_development_dependency "simplecov", "~> 0.10", "< 0.18"
end
