Gem::Specification.new do |s|
  s.name            = "rack-redirector"
  s.version         = "0.1.1"
  s.platform        = Gem::Platform::RUBY
  s.summary         = "Rack middleware to redirect"
  s.license         = "MIT"

  s.description = <<-EOF
See https://github.com/borot/rack-redirector.
EOF

  s.files           = Dir['{lib/**/*}'] +
                        %w(rack-redirector.gemspec README.md)
  s.require_path    = 'lib'

  s.author          = 'Masato Ishimoto'
  s.email           = 'masato.ishimoto@gmail.com'
  s.homepage        = 'https://github.com/borot/rack-redirector'
end
