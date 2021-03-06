# frozen_string_literal: true
source 'https://rubygems.org'

ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'pg',    '~> 0.18'
gem 'rails', '~> 5.1.0.rc1'

# API
gem 'jsonapi-resources'
gem 'oj'
gem 'oj_mimic_json'
gem 'jsonapi-utils', '~> 0.7.0'

# Data
gem 'cancancan'
gem 'friendly_id'
gem 'seed-fu'

# Auth and Omniauth
gem 'bcrypt'
gem 'jwt'

# Uploads
gem 'carrierwave-base64'
gem 'mini_magick'

# Templating
gem 'slim-rails'
gem 'will_paginate'

group :development, :test do
  gem 'byebug',                    platform: :mri
  gem 'faker'
  gem 'rubocop',                   require: false
  gem 'webmock'
end

group :development do
  gem 'bullet'
  gem 'annotate'
  gem 'brakeman',                  require: false
  gem 'listen',                    '~> 3.0.5'
  gem 'pry-rails'
  gem 'rails-erd'
  gem 'spring'
  gem 'spring-watcher-listen',     '~> 2.0.0'
end

group :test do
  gem 'bullet'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'factory_girl_rails'
  gem 'rspec-activejob'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'codeclimate-test-reporter'
  gem 'timecop'
end

# Server
gem 'dotenv-rails'
gem 'puma'
gem 'rack-cors'
gem 'rails_12factor',              group: :production
gem 'redis-rails'
gem 'resque'
gem 'resque-scheduler'
gem 'resque_mailer'
gem 'tzinfo-data'
