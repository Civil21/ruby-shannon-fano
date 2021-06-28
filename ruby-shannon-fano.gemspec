# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'ruby-shannon-fano'
  spec.version = '0.1.0'
  spec.authors = %w[Civil21 Reidond]
  spec.email = ['diusolexander@gmail.com', 'reidond@gmail.com']

  spec.summary = 'кодування Шеннона-Фано'
  spec.description = 'Цей gem реалізує кодування Шеннона-Фано для текстових рядків на Ruby'
  spec.homepage = 'https://github.com/Civil21/ruby-shannon-fano'
  spec.license = 'MIT'
  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/Civil21/ruby-shannon-fano/issues',
    'source_code_uri' => 'https://github.com/Civil21/ruby-shannon-fano'
  }

  spec.executables = %w[rsfano]
  spec.files = Dir.glob('lib/**/*') + Dir.glob('bin/*') + %w[README.md MIT-LICENSE CHANGELOG.md]
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.6.0'

  spec.add_development_dependency 'bundler', '>= 1'
end
