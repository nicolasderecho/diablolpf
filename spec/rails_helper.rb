ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
Dir[Rails.root.join('spec/modules/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema! # If you are not using ActiveRecord, you can remove this line.

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  
  config.fixture_path = "#{::Rails.root}/spec/fixtures" # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign it to false
  config.use_transactional_fixtures = true

  config.mock_with :rspec
  config.use_transactional_fixtures = false
  config.order = 'random'

  config.infer_base_class_for_anonymous_controllers = true
  config.infer_spec_type_from_file_location! # The different available types are documented in the features, such as in https://relishapp.com/rspec/rspec-rails/docs
  
  #config.filter_rails_from_backtrace! # Filter lines from Rails gems in backtraces.

end
