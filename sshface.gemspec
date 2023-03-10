require_relative 'lib/sshface/version'

Gem::Specification.new do |spec|
  spec.name          = "sshface"
  spec.version       = Sshface::VERSION
  spec.authors       = ["Oleg Orlov"]
  spec.email         = ["orelcokolov@gmail.com"]

  spec.summary       = %q{Change ssh identity between profiles}
  spec.description   = %q{You can create .ssh-name1 and .ssh-name2 folders and pick what you want}
  spec.homepage      = "https://github.com/OrelSokolov/sshface"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/OrelSokolov/sshface"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
