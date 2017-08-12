require 'capybara'
# require 'capybara/cucumber' # reset user section after each scenario execution
require 'capybara/dsl'				# Added to keep user section after scenario executions
require 'capybara/rspec/matchers'	# Added to keep user section after scenario executions
require 'selenium-webdriver'
require 'rspec'

World(Capybara::DSL)				# Added to keep user section after scenario executions
World(Capybara::RSpecMatchers)		# Added to keep user section after scenario executions

Capybara.configure do |config|
	config.default_driver = :selenium
	config.app_host = 'http://ninjainvoices.herokuapp.com'
end

Capybara.default_max_wait_time = 5