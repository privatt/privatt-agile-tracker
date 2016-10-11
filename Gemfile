source 'http://rubygems.org'

gem 'rails', '4.1.16'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 2.5.3'
gem 'jquery-rails'
gem 'ejs'
gem 'compass-rails'
gem 'devise', '~> 3.2.4'
gem 'transitions', '0.1.9', require: ['transitions', 'active_record/transitions']
gem 'rails-i18n'
gem 'configuration'
gem 'rails-observers', '~> 0.1.2'
gem 'jquery-ui-rails'

gem 'pg'

# For assets compilation and migration on remote servers
gem 'therubyracer', platforms: :ruby

group :development do
  gem 'letter_opener'
end

group :development, :test do
  gem 'pry'
  gem 'rspec-rails', '3.4.2'
  gem 'rspec-its'
  gem 'rspec-activemodel-mocks'
  gem 'factory_girl_rails'
  gem 'jasmine-rails'
  gem 'sinon-rails'
  gem 'capybara', '2.7.1'
  gem 'selenium-webdriver'
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'quiet_assets'
end

group :production do
  gem 'unicorn', '5.1.0'
end
