source 'https://rubygems.org'
ruby '2.4.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'

gem 'active_model_serializers', '~> 0.10.0'

gem 'kaminari' #Pagination
gem 'searchlight' #Search
gem "mongoid", "~> 6.2.0"
gem 'bson_ext'
gem 'rack-cors'
gem 'thin' # Server
gem 'mini_magick'
gem 'carrierwave'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'pg', '~> 0.15'

gem 'airbrake', '~> 5.7'
group :production do
  gem 'newrelic_rpm'
end

group :development, :test do
  #Manage ENV variables
  gem 'dotenv-rails'
  # Testing
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'selenium-webdriver', '~> 2.48.1'
  gem 'faker'
  gem 'database_cleaner', '~> 1.5'
  #Debug and Dev
  gem 'listen', '~> 3.0.5'
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem "better_errors" #better error screen
  gem "binding_of_caller" #for better error best support
  gem 'pry-rescue' #with bundle exec rescue rails server init rescue and open pry on wach exception not rescued. also rescue rspec
  gem 'awesome_print' #beatiful puts.!
  gem 'pry-state' #session pry state - variables on screen alternative pry-inline
  gem 'foreman'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
