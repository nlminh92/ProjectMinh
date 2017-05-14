source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'coffee-script-source', '1.8.0'
gem 'devise', '4.0'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'rails', '~> 5.0.1'
gem 'carrierwave', '~> 1.0'

group :test do
	gem 'sqlite3'
  # gem "mysql2", "~> 0.3.20"
end
# group :development, :production do
#   	gem 'pg'
# 	 # gem 'sqlite3'
#   # gem "mysql2", "~> 0.3.20"
# end
group :development, :production do
	# gem 'sqlite3'
  gem 'pg'
  # gem "mysql2", "~> 0.3.20"
   gem 'rails_12factor'
end

gem 'font-awesome-rails', '~> 4.6', '>= 4.6.3.1'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'tzinfo-data'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'config'
gem 'will_paginate'
gem 'bootstrap-toggle-rails'
gem "angularjs-rails"

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
end
