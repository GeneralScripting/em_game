
require 'rbconfig'

HOST_OS = RbConfig::CONFIG['host_os']

source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'mysql2'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem "compass", "~> 0.12.1"
  gem "compass-rails", "~> 1.0.0"
  gem "compass-960-plugin", "~> 0.10.4"
end

group :test do
  gem "cucumber-rails", ">= 1.3.0", :require => false
  gem "capybara", ">= 1.1.2"
  gem "database_cleaner", ">= 0.7.2"
  gem "launchy", ">= 2.1.0"
  gem "email_spec", ">= 1.2.1"
  gem 'shoulda'
end

gem 'jquery-rails'
gem "haml", ">= 3.1.6"
gem "haml-rails", ">= 0.3.4", :group => :development
gem "bootstrap-sass", ">= 2.0.3"
gem "simple_form"
gem "airbrake"
gem 'hpricot'
gem 'localized_country_select', :git => 'git://github.com/kristianmandrup/localized_country_select.git'


gem "rspec-rails", ">= 2.10.1", :group => [:development, :test]
gem "factory_girl_rails", ">= 3.3.0", :group => [:development, :test]

gem "guard", ">= 0.6.2", :group => :development  

case HOST_OS
  when /darwin/i
    gem 'rb-fsevent', :group => :development
    gem 'growl', :group => :development
  when /linux/i
    gem 'libnotify', :group => :development
    gem 'rb-inotify', :group => :development
  when /mswin|windows/i
    gem 'rb-fchange', :group => :development
    gem 'win32console', :group => :development
    gem 'rb-notifu', :group => :development
end

gem "guard-bundler", ">= 0.1.3", :group => :development
gem "guard-rails", ">= 0.0.3", :group => :development
gem "guard-livereload", ">= 0.3.0", :group => :development
gem "guard-rspec", ">= 0.4.3", :group => :development
gem "guard-cucumber", ">= 0.6.1", :group => :development
gem "facebooker2"