source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'thin'
gem 'mysql2'
gem 'devise'
gem 'cancan'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass', '~> 2.1.1.0'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem "paperclip", "~> 3.0"
gem 'brazilian-rails'


group :development do
  gem 'rails-erd'
  gem 'guard-test'
  gem 'pry-rails'
end

group :development, :test do
  gem 'qunit-rails'
end

group :test do
  gem 'shoulda'
  gem 'mocha'
  gem 'ruby-prof'
  # test coverage
  gem 'simplecov', :require => false
  gem 'rake'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano', '~> 2.13.5'

# To use debugger
# gem 'debugger'
