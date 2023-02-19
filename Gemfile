# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4', '>= 7.0.4.2'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem 'jsbundling-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem 'cssbundling-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

gem 'devise', '~> 4.8.1'
gem 'factory_bot_rails', '~> 6.2.0'
gem 'haml-rails', '~> 2.0'

# Use statinize for statinization, for more information see https://github.com/Vagab/statinize
gem 'draper', '~> 4.0.2'
gem 'pry', '~> 0.14.1'
gem 'simple_form', '~> 5.1.0'
gem 'statinize', '~> 0.4.7'

group :development, :test do
  gem 'ffaker', '~> 2.20.0'
  gem 'rspec-rails', '~> 5.1.2'
  gem 'rubocop', '~> 1.36.0'
  gem 'rubocop-performance', '~> 1.15.0'
  gem 'rubocop-rails', '~> 2.16.1', require: false
  gem 'rubocop-rspec', '~> 2.13.2', require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'fasterer', '~> 0.10.0'
  gem 'overcommit', '~> 0.60.0'
  gem 'web-console'
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 5.2.0'
  gem 'simplecov', '~> 0.21.2'
  gem 'webdrivers'
end
