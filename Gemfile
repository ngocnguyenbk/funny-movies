source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "bootsnap", require: false
gem "bootstrap", "~> 5.1.3"
gem "devise"
gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "sassc-rails"
gem "simple_form"
gem "slim"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "video_info"

group :development, :test do
  gem "pry"
  gem "rspec-rails"
end

group :development do
  gem "bcrypt_pbkdf"
  gem "capistrano", "~> 3.17", require: false
  gem "capistrano3-puma"
  gem "capistrano-bundler", require: false
  gem "capistrano-rails", require: false
  gem "capistrano-rbenv", "~> 2.2", require: false
  gem "ed25519"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "factory_bot_rails"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "selenium-webdriver"
  gem "shoulda-matchers"
end
