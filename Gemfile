ruby '1.9.3'
source :rubygems

gem 'rails', '3.2.8'
gem 'jquery-rails'
gem 'foreman'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier',     '>= 1.0.3'
end

group :production do
  gem 'pg' # postgresql db adapter
end

group :development do
  gem 'thin',         '~> 1.4.1'  # better than webrick
  gem 'sextant',      '~> 0.1.3'  # /rails/routes path in app
  gem 'quiet_assets', '~> 1.0.1'  # silence asset pipeline noise
  gem 'marginalia',   '~> 1.1.0'  # annotates sql logs
  gem 'heroku',       '~> 2.31.2' # for deployment

  gem 'guard',          '~> 1.3.2'
  gem 'guard-rspec',    '~> 1.2.1'
  gem 'guard-cucumber', '~> 1.2.0'
  gem 'ruby_gntp',      '~> 0.3.4' # growl notifier
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 2.11.0'
end

group :test do
  gem 'cucumber-rails',   '~> 1.3.0', require: false
  gem 'database_cleaner', '~> 0.8.0'
  gem 'launchy',          '~> 2.1.2'
  gem 'capybara',         '~> 1.1.2'
end
