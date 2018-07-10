require 'capybara/rspec'
require 'rspec/retry'

RSpec.configure do |config|
  config.disable_monkey_patching!
  config.order = :random
  Kernel.srand config.seed
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end
  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end
  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end
  ########################### Rspec Retry config #########################

  ########################### Rspec Retry config #########################
  config.around :each, :js do |ex|
    ex.run_with_retry retry: 4
  end

  ########################### Cache #######################################
  config.around :each do |ex|
    Rails.cache.clear
    ex.run
    Rails.cache.clear
  end
end

