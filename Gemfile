source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

gem "aws-sdk-s3", require: false
gem "delayed_job_active_record"
gem "rails", "~> 6.1.1"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 5.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"

gem "bootsnap", ">= 1.4.4", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem "rack-mini-profiler", "~> 2.0"
  gem "listen", "~> 3.3"
  gem "spring"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "webmock"
end

group :test, :development do
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "shoulda-matchers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]


gem "hotwire-rails", "~> 0.1.3"

gem "redis", "~> 4.2"

gem "httparty", "~> 0.18.1"
