source 'https://rubygems.org'
ruby '2.5.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'

gem 'active_model_serializers', '~> 0.10.0'

gem 'kaminari' #Pagination
gem 'searchlight' #Search
gem "mongoid", "~> 6.4.2"
gem 'bson_ext'
gem 'rack-cors', require: 'rack/cors'
gem 'airbrake', '~> 5.7'

group :development, :test do
  gem 'thin' # Server
  #Manage ENV variables
  gem 'dotenv-rails'
  # Testing
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'faker'
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

group :production do
  gem 'puma'
  gem 'newrelic_rpm'
end