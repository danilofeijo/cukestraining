require 'capybara'
# require 'capybara/cucumber' # reset user section after each scenario execution
require 'capybara/dsl'				# Added to keep user section after scenario executions
require 'capybara/rspec/matchers'	# Added to keep user section after scenario executions
require 'selenium-webdriver'
require 'rspec'
require 'site_prism'
require 'faker'

World(Capybara::DSL)				# Added to keep user section after scenario executions
World(Capybara::RSpecMatchers)		# Added to keep user section after scenario executions

# Chromedrive settings - Enabling Chrome browser for automation
Capybara.register_driver :chrome do |app|
	options = {
		:js_errors => false,
		# :timeout => 360,
		:debug => false,
		:inspector => false,
	}
	Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

# Choose default browser (Chrome and Firefox)
Capybara.configure do |config|
	config.default_driver = :chrome
	# config.default_driver = :selenium
	config.app_host = 'http://ninjainvoices.herokuapp.com'
end

Capybara.default_max_wait_time = 5
