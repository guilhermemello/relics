if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

source "https://rubygems.org"

gem "rails", "3.2.12"
gem "mysql2"
gem "jquery-rails"
gem "devise", ">= 2.1.2"
gem "cancan", ">= 1.6.8"
gem "rolify", ">= 3.2.0"
gem "quiet_assets", ">= 1.0.1"
gem "figaro", ">= 0.5.0"
gem "better_errors", ">= 0.2.0"
gem "binding_of_caller", ">= 0.6.8"
gem "meta_search"
gem "will_paginate"
gem "paperclip", "~> 3.4.2"
gem "date_validator"
gem "webrick", "~> 1.3.1"
gem "enumerize"
gem "simple_form"
gem "watu_table_builder", :require => "table_builder"
gem "rmagick"
gem 'aws-sdk'

group :test do
  gem "rspec", "2.11.0"
  gem "rspec-rails", "2.11.4"
  gem "factory_girl", "~> 4.2.0"
  gem "capybara", "~> 2.0.2"
  gem "selenium-client"
  gem "selenium-webdriver", "2.25.0"
  gem "database_cleaner", ">= 0.9.1"
  gem "launchy", ">= 2.1.2"
end

group :assets do
  gem "sass-rails",   "~> 3.2.3"
  gem "coffee-rails", "~> 3.2.1"
  gem "uglifier", ">= 1.0.3"
  gem 'therubyracer', :platforms => :ruby
  gem 'execjs'
end 