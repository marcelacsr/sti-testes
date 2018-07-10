ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'shoulda/matchers'
require 'paperclip/matchers'
require 'capybara/poltergeist'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Capybara.javascript_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
  options = { js_errors: false, # silences js errors
              window_size: [1920,900] }
  Capybara::Poltergeist::Driver.new(app, options)
end

# Capybara.register_driver :chrome do |app|
#   Capybara::Selenium::Driver.new(app, browser: :chrome)
# end
# Capybara.javascript_driver = :chrome

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.render_views
  config.include FactoryBot::Syntax::Methods
  config.include Paperclip::Shoulda::Matchers
  config.include ActiveSupport::Testing::TimeHelpers
  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
  config.include(Shoulda::Matchers::Independent, type: :model)
  config.include LoginHelper, type: :request
  config.include LoginHelper, type: :feature
  config.include LoginHelper, type: :controller

  # config.before(:each, js: true) do
  # Capybara.page.driver.browser.manage.window.maximize
  # end
end
