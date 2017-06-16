require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'rspec'

Capybara.configure do |config|
	config.default_driver = :selenium
	config.app_host = 'http://ninjainvoices.herokuapp.com'
end

Capybara.default_max_wait_time = 5